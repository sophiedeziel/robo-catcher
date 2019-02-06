class PiController < ApplicationController
  def reboot
    exec("reboot")
    head :ok
  end

  def shut_down
    exec("shutdown")
    head :ok
  end
end
