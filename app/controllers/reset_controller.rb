class ResetController < ApplicationController
  before_action :set_reset

  def edit
  end

  def update
    @reset.update(params.require(:reset).permit(Reset.attribute_names))
    export_all
    redirect_to edit_reset_path
  end

  def start
    export_all
    start_process("ruby lib/sequences/trash.rb reset")
    redirect_to edit_reset_path
  end

  private

  def set_reset
    @reset = Reset.instance
  end
end
