class RenameSecretsToSettings < ActiveRecord::Migration[5.2]
  def change
    rename_table :secrets, :settings
  end
end
