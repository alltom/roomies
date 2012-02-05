class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :name

      t.timestamps
    end
  end
end
