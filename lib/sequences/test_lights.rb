Trash.define "test_lights" do
  leds = %i(normal reset a x home shiny not_shiny)

  5.times do
    leds.each do |led|
      light(led, true)
      sleep(0.5)
    end
    leds.each do |led|
      light(led, false)
      sleep(0.5)
    end
  end
end
