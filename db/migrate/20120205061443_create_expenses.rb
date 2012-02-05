class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.belongs_to :payer
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :expenses, :payer_id
  end
end
