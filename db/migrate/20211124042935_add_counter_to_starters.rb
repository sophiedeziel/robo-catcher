class AddCounterToStarters < ActiveRecord::Migration[5.2]
  def change
    create_table :starters do |t|
      t.integer :run_tries, default: 0
      t.integer :total_tries, default: 0
    end
  end
end
