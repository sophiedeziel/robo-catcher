class CreateSequences < ActiveRecord::Migration[6.1]
  def change
    create_table :sequences do |t|
      t.string :name
      t.integer :total_attempts_count, default: 0
      t.integer :current_run_number, default: 0

      t.timestamps
    end
  end
end
