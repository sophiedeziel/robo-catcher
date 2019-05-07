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

    puts "Load les séquences"
    Dir[File.join(__dir__, 'definitions', '*.rb')].each { |file| require file }
  end

  def fire(name)
    if @@sequences[name].nil?
      puts "Invalid command"
      return
    end
    puts "Démarer la séquence"
    instance_exec &@@sequences[name]
  end

  def self.define name, &block
    @@sequences[name] = block
  end
end


puts "Démarer Trash"
Trash.new.fire(ARGV[0])


