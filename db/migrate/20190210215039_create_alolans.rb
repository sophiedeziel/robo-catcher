class CreateAlolans < ActiveRecord::Migration[5.2]
  def change
    create_table :alolans do |t|
      t.string :pokemon, default: 'Rattata'
      t.integer :rattata_range_min
      t.integer :rattata_range_max

      t.integer :run_tries, default: 0
      t.integer :total_tries, default: 0

      t.integer :number, default: 10

      t.integer :delay_1, default: 1000
      t.integer :delay_2, default: 1000
      t.integer :delay_3, default: 1000
      t.integer :delay_4, default: 1000
      t.integer :delay_5, default: 1000
      t.integer :delay_6, default: 1000
      t.integer :delay_7, default: 1000
      t.integer :delay_8, default: 1000
      t.integer :delay_9, default: 1000
      t.integer :delay_10, default: 1000
      t.integer :delay_11, default: 1000

      t.timestamps
    end
  end
end
