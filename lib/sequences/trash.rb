require_relative 'hardware'
require_relative 'config'

class Trash
  attr_accessor :hardware
  delegate :press, :normal_mode, :light, to: :hardware

  def initialize
    @config = Config.new
    @hardware = Hardware.new @config.hardware
    @@sequences = {}
    require_relative 'alolan'
    require_relative 'test_lights'
  end

  def alolan
    puts "Starting alolan sequence"
    instance_exec &@@sequences['alolan']
  end

  def reset
    puts "Starting reset sequence"
    instance_exec &@@sequences['reset']
  end

  def test_lights
    puts "testing lights"
    puts @@sequences['test_lights']

    instance_exec &@@sequences['test_lights']
  end

  def self.define name, &block
    @@sequences[name] = block
  end
end

case ARGV[0]
when "alolan"
  Trash.new.alolan
when "reset"
  Trash.new.reset
when "test-lights"
  Trash.new.test_lights
else
  puts "Invalid command"
end


