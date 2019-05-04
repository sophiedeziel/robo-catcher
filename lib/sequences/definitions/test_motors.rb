Trash.define "test_motors" do
  leds = %i(normal reset a x home shiny not_shiny)

  5.times do
    press(:a, 200)
    press(:x, 200)
    press(:home, 200)
  end
end
