class InstructionsController < ApplicationController
  before_action :assign_sequence

  def create
    if params.has_key?(:instruction_wait)
      attributes = params.require(:instruction_wait).permit(:comment, :time)
      attributes[:params] = {time: attributes.delete(:time)}
      attributes[:sequence] = @sequence

      Instruction::Wait.create(attributes)
    end
    redirect_to [:edit, @sequence]
  end

  def destroy
  end

  private

  def assign_sequence
    @sequence = Sequence.find(params[:sequence_id])
  end
end