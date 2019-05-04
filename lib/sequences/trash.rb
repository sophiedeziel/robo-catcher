require_relative 'hardware'
require_relative 'config'

class Trash
  attr_accessor :hardware
  delegate :press, :normal_mode, :light, to: :hardware

  def initialize
    @config = Config.new
    @hardware = Hardware.new @config.hardware
    @@sequences = {}

    Dir[File.join(__dir__, 'definitions', '*.rb')].each { |file| require file }
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

  def test_motors
    puts "testing motors"
    puts @@sequences['test_motors']

    instance_exec &@@sequences['test_motors']
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
when "test-motors"
  Trash.new.test_motors
else
  puts "Invalid command"
end


