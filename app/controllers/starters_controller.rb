

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
    end

    redirect_to edit_starter_path
  end

  def show
    render json: @starter
  end

  private

  def start
    $trash.fire('starter')
  end

  def reset
    $trash.fire('starter_reset')
  end

  def set_starter
    @starter = Starter.first_or_create
  end
end

