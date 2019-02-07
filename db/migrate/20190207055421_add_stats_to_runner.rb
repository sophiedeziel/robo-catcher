class AddStatsToRunner < ActiveRecord::Migration[5.2]
  def change
    add_column :fossils, :total_tries, :integer, default: 0
    add_column :fossils, :run_tries, :integer, default: 0
  end
end
