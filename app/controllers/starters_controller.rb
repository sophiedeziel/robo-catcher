

class StartersController < ApplicationController
  before_action :set_starter

  def edit
    
  end

  def update
    case params.require(:commit)
    when "Save"
      @starter.update(params.require(:starter).permit(Starter.attribute_names)) 
    when "Start"
      start
    when "Reset"
      reset 
    when "Stop"
      $trash.stop
      sleep 1
      $trash.fire('raise_motors')
      sleep 3
    end

    redirect_to edit_starter_path
  end

  def show
    render json: @starter
  end

  private

  def start
    #start_process("ruby lib/sequences/trash.rb starter")
    $trash.fire('starter')
  end

  def reset
    #start_process("ruby lib/sequences/trash.rb starter")
    $trash.fire('starter_reset')
  end

  def set_starter
    @starter = Starter.instance
  end
end

