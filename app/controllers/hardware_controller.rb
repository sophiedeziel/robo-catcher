class HardwareController < ApplicationController
  include ExportSettings
  before_action :set_hardware

  def edit

  end

  def update
    @hardware.update(params.require(:hardware).permit(Hardware.attribute_names))
    export_all
    start_process("ruby lib/sequences/trash.rb test-lights") if params.require(:commit) == "Test lights"
    redirect_to edit_hardware_path
  end

  private

  def set_hardware
    @hardware = Hardware.instance
  end
end
