class AddCloudinaryCloudSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :cloudinary_cloud, :string, default: 'duj3xcocx'
  end
end
