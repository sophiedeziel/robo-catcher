class PiController < ApplicationController
  def reboot
    exec("reboot")
    head :ok
  end

  def shut_down
    exec("poweroff")
    head :ok
  end
end
