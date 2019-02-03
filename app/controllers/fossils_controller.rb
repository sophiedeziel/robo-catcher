class FossilsController < ApplicationController
  before_action :set_fossil

  def edit
  end

  def update
    @fossil.update(params.require(:fossil).permit(Fossil.attribute_names))
    redirect_to edit_fossil_path
  end

  private
  def set_fossil
    @fossil = Fossil.last || Fossil.create
  end
end
