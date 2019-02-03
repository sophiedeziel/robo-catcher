class CreateFossils < ActiveRecord::Migration[5.2]
  def change
    create_table :fossils do |t|

      t.timestamps
    end
  end
end
