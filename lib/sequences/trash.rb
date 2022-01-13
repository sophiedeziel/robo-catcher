require_relative 'hardware'
require_relative 'communication'
require_relative 'webcam'
require 'active_support/core_ext/module/delegation'

class Trash
  attr_accessor :hardware, :webcam, :communication
  
  delegate :press, :normal_mode, :reseting, :raise_motors, :lower_motors, :light, :motor_angle, :reset_lights, to: :hardware
  delegate :shiny?, :get_pixel_color, to: :webcam
  delegate :send_message, :send_image, to: :communication

  def initialize
    @hardware = HardwareConfig.new
    @webcam = Webcam.new
    @communication = Communication.new
    @@sequences = {}
    @current_runner = nil

    Rails.logger.info "Load les séquences"
    Dir[File.join(__dir__, 'definitions', '*.rb')].each { |file| require file }
  end

  def launch_sequence(sequence_id)
    if busy?
      Rails.logger.error('Thread already running')
      return
    end
    
    ActionCable.server.broadcast("trash", { status: "on" })

    @current_runner = Thread.new do
      lower_motors
      reset_lights

      @sequence = Sequence.preload(:instructions).find(sequence_id)
      
      run_sequence_instructions(@sequence.instructions.to_a.first)

      ActionCable.server.broadcast("trash", { status: "stopping" })
      raise_motors
      ActionCable.server.broadcast("trash", { status: "off" })
    end
  end

  def run_sequence_instructions(instruction)
    while(instruction)
      Rails.logger.info("Instruction: #{instruction.type}, #{instruction.comment}, #{instruction.params}")
      instruction.execute(self)
      instruction = instruction.next_instruction
    end
  end

  def busy?
    return false unless @current_runner
    @current_runner.alive?
  end

  def stop
    Rails.logger.info "Interrompre la séquence"
    ActionCable.server.broadcast("trash", { status: "stopping" })

    @current_runner&.exit
    sleep 1
    raise_motors
    sleep 3

    ActionCable.server.broadcast("trash", { status: "off" })
  end

  def self.define name, &block
    @@sequences[name] = block
  end

  # deprecated
  def run_sequence(name)
    if @@sequences[name].nil?
      Rails.logger.error "Invalid command"
      return
    end
    Rails.logger.info "Démarrer la séquence"
    instance_exec &@@sequences[name]
  end

  # deprecated
  def fire(name)
    if busy?
      Rails.logger.error('Thread already running')
      return
    end
    
    ActionCable.server.broadcast("trash", { status: "on" })
    @current_runner = Thread.new do
      reset_lights
      run_sequence(name)
    end
    ActionCable.server.broadcast("trash", { status: "off" })
  end
end
