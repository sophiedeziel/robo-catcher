class SecretController < ApplicationController
  before_action :set_secret

  def edit
  end

  def update
    @secret.update(params.require(:secret).permit(Secret.attribute_names))
    redirect_to edit_secret_path
  end

  private

  def set_secret
    @secret = Secret.last || Secret.create
  end
end
