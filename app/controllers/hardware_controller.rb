class HardwareController < ApplicationController
  include ExportSettings
  before_action :set_hardware

  def edit

  end

  def update
    @hardware.update(params.require(:hardware).permit(Hardware.attribute_names))
    export_all
    start_process("ruby lib/sequences/trash.rb test_lights") if params.require(:commit) == "Test lights"
    start_process("ruby lib/sequences/trash.rb test_motors") if params.require(:commit) == "Test motors"
    start_process("ruby lib/sequences/trash.rb raise_motors") if params.require(:commit) == "Raise motors"
    start_process("ruby lib/sequences/trash.rb zero_motors") if params.require(:commit) == "Center motors"
    start_process("ruby lib/sequences/trash.rb lower_motors") if params.require(:commit) == "Lower motors"
    start_process("ruby lib/sequences/trash.rb test_a") if params.require(:commit) == "Test a"
    start_process("ruby lib/sequences/trash.rb test_x") if params.require(:commit) == "Test x"
    start_process("ruby lib/sequences/trash.rb test_home") if params.require(:commit) == "Test home"
    redirect_to edit_hardware_path
  end

  private

  def set_hardware
    @hardware = Hardware.instance
  end
end
