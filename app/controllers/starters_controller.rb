class StartersController < ApplicationController
  include ExportSettings

  def edit
  end

  def update
    export_all
    start if params.require(:commit) == "Start"
    redirect_to edit_starters_path
  end

  def stop
    Process.kill("HUP", $robot_pid)
    Process.wait
    redirect_to edit_starters_path
  end

  def show
    render json: {}
  end

  private

  def start
    start_process("ruby lib/sequences/trash.rb starter")
  end
end

