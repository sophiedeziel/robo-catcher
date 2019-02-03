class AddFieldsToFossils < ActiveRecord::Migration[5.2]
  def change
    add_column :fossils, :number, :integer, default: 10
    add_column :fossils, :delay_1, :integer, default: 1000
    add_column :fossils, :delay_2, :integer, default: 1000
    add_column :fossils, :delay_3, :integer, default: 1000
    add_column :fossils, :delay_4, :integer, default: 1000
    add_column :fossils, :delay_5, :integer, default: 1000
    add_column :fossils, :delay_6, :integer, default: 1000
    add_column :fossils, :delay_7, :integer, default: 1000
    add_column :fossils, :delay_8, :integer, default: 1000
    add_column :fossils, :delay_9, :integer, default: 1000
    add_column :fossils, :delay_10, :integer, default: 1000
    add_column :fossils, :delay_11, :integer, default: 1000
    add_column :fossils, :delay_12, :integer, default: 1000
    add_column :fossils, :delay_13, :integer, default: 1000
    add_column :fossils, :delay_13b, :integer, default: 1000
    add_column :fossils, :delay_14, :integer, default: 1000
    add_column :fossils, :delay_15, :integer, default: 1000
    add_column :fossils, :delay_16, :integer, default: 1000
    add_column :fossils, :delay_17, :integer, default: 1000
    add_column :fossils, :delay_18, :integer, default: 1000
    add_column :fossils, :delay_19, :integer, default: 1000
    add_column :fossils, :delay_20, :integer, default: 1000
    add_column :fossils, :delay_21, :integer, default: 1000
    add_column :fossils, :delay_22, :integer, default: 1000
    add_column :fossils, :delay_23, :integer, default: 1000
    add_column :fossils, :delay_24, :integer, default: 1000
    add_column :fossils, :delay_25, :integer, default: 1000
    add_column :fossils, :delay_26, :integer, default: 1000
  end
end

#
#int int_fossil = 20

# Main_Loop_Fossil
#
#  Input A, Delay_1
#  Input A, Delay_2
#  Input A, Delay_3
#  Input A, Delay_4
#  Input A, Delay_5
#  Input A, Delay_6
#  Input A, Delay_7
#  Input A, Delay_8
#  Input A, Delay_9
#  Input A, Delay_10
#  Input A, Delay_11
#  Input A, Delay_12
#  Input A, Delay_13
#  Input A, Delay_13b (if new stat)
#  Bool Camera_Shiny
#  if Camera_Shiny = true
# 	END
#  else
#  Input A, Delay_14
#  Input A, Delay_15
#  int_fossil --
#  if int_fossil > 0
# 	GOTO Main_Loop_Fossil
#  else
#  Input Home, Delay_16
#  Input X, Delay_17
#  Input A, Delay_18
#  Input A, Delay_19
#  Input A, Delay_20
#  Input A, Delay_21
#  Input A, Delay_22
#  Input A, Delay_23
#  Input A, Delay_24
#  Input A, Delay_25
#  Input A, Delay_26
#
#  Goto Main_loop_Fossil
