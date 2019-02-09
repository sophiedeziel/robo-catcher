class FossilsController < ApplicationController
  before_action :set_fossil

  def edit
  end

  def update
    @fossil.update(params.require(:fossil).permit(Fossil.attribute_names))
    start if params.require(:commit) == "Start"
    redirect_to edit_fossil_path
  end

  def stop
    Process.kill("HUP", $robot_pid)
    Process.wait
    redirect_to edit_fossil_path
  end

  def show
    render json: @fossil
  end

  private

  def set_fossil
    @fossil = Fossil.last || Fossil.create
  end

  def start
    $robot_pid = Process.fork do
      exec("rails robo_catcher:fossil")
    end
  end

end
