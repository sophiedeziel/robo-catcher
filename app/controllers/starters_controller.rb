

class StartersController < ApplicationController
  #include ExportSettings
  before_action :set_starter

  def edit
    
  end

  def update
    #export_all
    start if params.require(:commit) == "Start"
    redirect_to edit_starters_path
  end

  def stop
    $trash.stop
    sleep 1
    $trash.fire('raise_motors')
    redirect_to edit_starters_path
  end

  def show
    render json: @starter
  end

  private

  def start
    #start_process("ruby lib/sequences/trash.rb starter")
    $trash.fire('starter')
  end

  def set_starter
    @starter = Starter.instance
  end
end

