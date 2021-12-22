class HardwareController < ApplicationController
  before_action :set_hardware

  def edit

  end

  def update
    @hardware.update(params.require(:hardware).permit(Hardware.attribute_names))

    scripts = {
      "Test lights" => 'test_lights',
      "Test motors" => 'test_motors',
      "Raise motors" => 'raise_motors',
      "Center motors" => 'zero_motors',
      "Lower motors" => 'lower_motors',
      "Test a" => 'test_a',
      "Test x" => 'test_x',
      "Test home" => 'test_home',
      "Test up" => 'test_up',
      "Test right" => 'test_right'
    }

    $trash.fire(scripts[params.require(:commit)])

    redirect_to edit_hardware_path
  end

  def show
    render json: { running: $trash.busy? }
  end


  private

  def set_hardware
    @hardware = Hardware.first_or_create
  end
end
