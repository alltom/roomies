class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.references :user
      t.references :household
      t.decimal :balance, :precision => 8, :scale => 2
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
