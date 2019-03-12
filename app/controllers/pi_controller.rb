class PiController < ApplicationController
  def reboot
    exec("reboot")
    head :ok
  end

  def shut_down
    exec("shutdown -h now")
    head :ok
  end

  def update
    exec("bin/update")
  end
end
