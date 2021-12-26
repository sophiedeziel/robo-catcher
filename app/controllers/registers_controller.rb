class RegistersController < ApplicationController
  before_action :assign_sequence
  before_action :assign_register, only: [:update, :destroy]

  def create
    Register.create(permitted_params.merge(sequence: @sequence))
    redirect_to edit_sequence_path(@sequence)
  end

  def update
    @register.update(permitted_params)
    redirect_to edit_sequence_path(@sequence)
  end

  def destroy
    @register.destroy
    redirect_to edit_sequence_path(@sequence)
  end

  private

  def assign_sequence
    @sequence = Sequence.find(params[:sequence_id])
  end

  def assign_register
    @register = Register.find(params[:id])
  end

  def permitted_params
    params.require(:register).permit(:name, :description, :value, :hide)
  end
end
