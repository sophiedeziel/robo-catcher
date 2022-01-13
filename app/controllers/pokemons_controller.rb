class PokemonsController < ApplicationController
  before_action :assign_sequence

  def create
    @pokemon = Pokemon.create(permitted_params.merge(sequence: @sequence))
    redirect_to [:edit, @sequence, @pokemon]
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(permitted_params)
    redirect_to [:edit, @sequence]
  end

  private

  def assign_sequence
    @sequence = Sequence.find(params[:sequence_id])
  end

  def permitted_params
    params.require(:pokemon).permit(:name, :image, :hue, :tolerance)
  end
end
