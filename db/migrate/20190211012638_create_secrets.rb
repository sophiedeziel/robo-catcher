class CreateSecrets < ActiveRecord::Migration[5.2]
  def change
    create_table :secrets do |t|
      t.string :numero
      t.string :twilio_sid
      t.string :twilio_token
      t.string :cloudinary_key
      t.string :cloudinary_secret

      t.timestamps
    end
  end
end
