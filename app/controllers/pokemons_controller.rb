class PokemonsController < ApplicationController
  before_action :assign_sequence

  def create
    Pokemon.create(permitted_params.merge(sequence: @sequence))
    redirect_to edit_sequence_path(@sequence)
  end

  private

  def assign_sequence
    @sequence = Sequence.find(params[:sequence_id])
  end

  def permitted_params
    params.require(:pokemon).permit(:name)
  end
end
