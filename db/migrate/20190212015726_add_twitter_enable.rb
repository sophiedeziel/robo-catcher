class AddTwitterEnable < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :twitter_enabled, :boolean, default: false
  end
end
