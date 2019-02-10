class HardwareController < ApplicationController
  before_action :set_hardware

  def edit

  end

  def update
    @hardware.update(params.require(:hardware).permit(Hardware.attribute_names))
  end

  private

  def set_hardware
    @hardware = Hardware.last || Hardware.create
  end
end
