require_relative 'hardware'
require_relative 'config'
require 'active_support/core_ext/module/delegation'

class Trash
  attr_accessor :hardware
  delegate :press, :normal_mode, :raise_motors, :light, :motor_angle, to: :hardware

  def initialize
    @config = Config.new
    @hardware = Hardware.new @config.hardware
    @@sequences = {}

    Dir[File.join(__dir__, 'definitions', '*.rb')].each { |file| require file }
  end

  def fire(name)
    if @@sequences[name].nil?
      puts "Invalid command"
      return
    end
    instance_exec &@@sequences[name]
  end

  def self.define name, &block
    @@sequences[name] = block
  end
end

Trash.new.fire(ARGV[0])


