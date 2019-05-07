class SettingsController < ApplicationController
  before_action :set_setting

  def edit
  end

  def update
    @setting.update(params.require(:setting).permit(Setting.attribute_names))
    export_all
    redirect_to edit_settings_path
  end

  private

  def set_setting
    @setting = Setting.instance
  end
end
