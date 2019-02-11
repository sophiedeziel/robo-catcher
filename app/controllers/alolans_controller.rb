class AlolansController < ApplicationController
  before_action :set_alolan

  def edit
  end

  def update
    @alolan.update(params.require(:alolan).permit(Alolan.attribute_names))
    start if params.require(:commit) == "Start"
    redirect_to edit_alolan_path
  end

  def stop
    Process.kill("HUP", $robot_pid)
    Process.wait
    redirect_to edit_alolan_path
  end

  def show
    render json: @alolan
  end

  private

  def set_alolan
    @alolan = Alolan.last || Alolan.create
  end

  def start
    start_process("rails robo_catcher:alolan")
  end
end

