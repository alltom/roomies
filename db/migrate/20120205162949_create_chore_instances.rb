class CreateChoreInstances < ActiveRecord::Migration
  def change
    create_table :chore_instances do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
