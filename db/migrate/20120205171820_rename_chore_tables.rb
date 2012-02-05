class RenameChoreTables < ActiveRecord::Migration
  def change
    rename_table :chore, :chores
    rename_table :offer, :offers
  end
end
