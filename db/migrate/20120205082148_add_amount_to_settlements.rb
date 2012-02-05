class AddAmountToSettlements < ActiveRecord::Migration
  def change
    add_column :settlements, :amount, :decimal, :precision => 8, :scale => 2
  end
end
