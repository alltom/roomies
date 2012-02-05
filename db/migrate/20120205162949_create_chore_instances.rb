class CreateChoreInstances < ActiveRecord::Migration
  def change
    create_table :chore do |t|
      t.string :name
      t.integer :interval
      t.integer :lead_time
      t.datetime :start_date
      t.references :household
      t.timestamps
    end

    create_table :offer do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.references :chore_instance
      t.references :offerer
      t.timestamps
    end

    create_table :chore_instances do |t|
      t.datetime :start
      t.datetime :end
      t.references :chore
      t.references :resident
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
