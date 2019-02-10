class CreateResets < ActiveRecord::Migration[5.2]
  def change
    create_table :resets do |t|
      @fossil = Fossil.last
      t.integer :home,    default: @fossil.delay_16
      t.integer :x,       default: @fossil.delay_17
      t.integer :delay_1, default: @fossil.delay_18
      t.integer :delay_2, default: @fossil.delay_19
      t.integer :delay_3, default: @fossil.delay_20
      t.integer :delay_4, default: @fossil.delay_21
      t.integer :delay_5, default: @fossil.delay_22
      t.integer :delay_6, default: @fossil.delay_23
      t.integer :delay_7, default: @fossil.delay_24
      t.integer :delay_8, default: @fossil.delay_25
      t.integer :delay_9, default: @fossil.delay_26

      t.timestamps
    end
  end
end
