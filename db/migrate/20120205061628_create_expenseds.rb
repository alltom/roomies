class CreateExpenseds < ActiveRecord::Migration
  def change
    create_table :expenseds do |t|
      t.references :expense
      t.references :resident
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :expenseds, :expense_id
    add_index :expenseds, :resident_id
  end
end
