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
    $trash.stop
    sleep 1
    $trash.fire('raise_motors')
    sleep 3
    redirect_to edit_alolan_path
  end

  def show
    render json: @alolan
  end

  private

  def set_alolan
    @alolan = Alolan.instance
  end

  def start
    $trash.fire('alolan')
    #start_process("ruby lib/sequences/trash.rb alolan")
  end
end

