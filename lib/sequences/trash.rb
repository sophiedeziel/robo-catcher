require_relative 'hardware'
require_relative 'communication'
require_relative 'webcam'
require 'active_support/core_ext/module/delegation'

class Trash
  attr_accessor :hardware, :webcam, :communication
  
  delegate :press, :normal_mode, :reseting, :raise_motors, :lower_motors, :light, :motor_angle, to: :hardware
  delegate :shiny?, to: :webcam
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

  def fire(name)
    if busy?
      Rails.logger.error('Thread already running')
      return
    end

    @current_runner = Thread.new do
      run_sequence(name)
    end
  end

  def run_sequence(name)
    if @@sequences[name].nil?
      Rails.logger.error "Invalid command"
      return
    end
    Rails.logger.info "Démarrer la séquence"
    instance_exec &@@sequences[name]
  end

  def busy?
    return false unless @current_runner
    @current_runner.alive?
  end

  def stop
    Rails.logger.info "Interrompre la séquence"
    @current_runner&.exit
  end

  def self.define name, &block
    @@sequences[name] = block
  end
end
