class SequencesController < ApplicationController
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
      redirect_to sequences_path
    else
      render :new
    end
  end

  def show
    @sequence = Sequence.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @sequence = Sequence.find(params[:id])
    @sequence.destroy
    redirect_to sequences_path
  end
end
