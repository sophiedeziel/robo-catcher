class SequencesController < ApplicationController
  before_action :assign_sequence, only: [:show, :edit, :update, :destroy]

  def index
    @sequences = Sequence.all
  end

  def new
    @sequence = Sequence.new
  end

  def create
    @sequence = Sequence.new(
      params.require(:sequence).permit(:name)
    )

    if @sequence.save
      redirect_to @sequence
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sequence.update(params.require(:sequence).permit(:name))
      redirect_to @sequence
    else
      render :update
    end
  end

  def destroy
    @sequence.destroy
    redirect_to sequences_path
  end

  def start
    if params[:sequence]
      @sequence = Sequence.find(params[:sequence_id])
      @sequence.update(current_pokemon_id: params.require(:sequence)["current_pokemon_id"])
    end
    $trash.launch_sequence(params[:sequence_id])
  end

  def stop
    $trash.stop
  end

  private

  def assign_sequence
    @sequence = Sequence.preload(:instructions, :registers).find(params[:id])
  end
end
