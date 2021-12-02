Trash.define "reset" do
  Rails.logger.info "On reset la Nintendo Switch!"

  @reset = Reset.instance

  reseting do
    press(:home, @reset.home)
    press(:x, @reset.x)
    press(:a, @reset.delay_1)
    press(:a, @reset.delay_2)
    press(:a, @reset.delay_3)
    press(:a, @reset.delay_4)
    press(:a, @reset.delay_5)
    press(:a, @reset.delay_6)
    press(:a, @reset.delay_7)
    press(:a, @reset.delay_8)
    press(:a, @reset.delay_9)
  end
end
