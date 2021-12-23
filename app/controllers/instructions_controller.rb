class InstructionsController < ApplicationController
  before_action :assign_sequence

  def create
    Instruction.transaction do

      attributes = params.require(:instruction).permit(:type, :comment )

      attributes[:params] = params.require(:instruction).permit(:time, :label, :sequence_id).to_h.compact
      attributes[:sequence] = @sequence

      insert_at = params.require(:instruction)[:add_after]

      instruction = Instruction.create(attributes)

      if insert_at.present?
        previous = Instruction.find(insert_at)
        if previous.next_intruction_id.present?
          instruction.update(next_intruction_id: previous.next_intruction_id)
        end

        previous.update(next_intruction_id: instruction.id)
      else
        instruction.update(next_intruction_id: @sequence.first_instruction_id)
        @sequence.update(first_instruction_id: instruction.id)
      end
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