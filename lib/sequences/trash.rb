require_relative 'hardware'
require_relative 'config'
require_relative 'webcam'
require 'active_support/core_ext/module/delegation'

class Trash
  attr_accessor :hardware, :webcam
  delegate :press, :normal_mode, :reseting, :raise_motors, :lower_motors, :light, :motor_angle, to: :hardware
  delegate :shiny?, to: :webcam

  def initialize
    @config = Config.new
    @hardware = Hardware.new @config.hardware
    @webcam = Webcam.new
    @@sequences = {}

    puts "Load les séquences"
    Dir[File.join(__dir__, 'definitions', '*.rb')].each { |file| require file }
  end

  def fire(name)
    if @@sequences[name].nil?
      puts "Invalid command"
      return
    end
    puts "Démarrer la séquence"
    instance_exec &@@sequences[name]
  end

  def self.define name, &block
    @@sequences[name] = block
  end
end

puts "Démarrer Trash"
Trash.new.fire(ARGV[0])

