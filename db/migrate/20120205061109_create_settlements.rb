class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.belongs_to :initiator
      t.belongs_to :payer
      t.belongs_to :payee
      t.boolean :confirmed

      t.timestamps
    end
    add_index :settlements, :initiator_id
    add_index :settlements, :payer_id
    add_index :settlements, :payee_id
  end
end
