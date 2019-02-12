class CreateTweetTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_templates do |t|
      t.string :event
      t.string :message

      t.timestamps
    end
  end
end
