class InstructionsController < ApplicationController
  before_action :assign_sequence

  def create
    Instruction.transaction do
      if params.has_key?(:instruction_wait)
        attributes = params.require(:instruction_wait).permit(:comment, :time)
        attributes[:params] = {time: attributes.delete(:time)}
        attributes[:sequence] = @sequence

        insert_at = params.require(:instruction_wait)[:add_after]

        instruction = Instruction::Wait.create(attributes)
      end

      if params.has_key?(:instruction_button_press)
        attributes = params.require(:instruction_button_press).permit(:label)
        attributes[:params] = {label: attributes.delete(:label)}
        attributes[:sequence] = @sequence

        insert_at = params.require(:instruction_button_press)[:add_after]

        instruction = Instruction::ButtonPress.create(attributes)
      end

      if params.has_key?(:instruction_sub_sequence)
        attributes = params.require(:instruction_sub_sequence).permit(:sequence_id)
        attributes[:params] = {sequence_id: attributes.delete(:sequence_id)}
        attributes[:sequence] = @sequence

        insert_at = params.require(:instruction_sub_sequence)[:add_after]

        instruction = Instruction::SubSequence.create(attributes)
      end

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