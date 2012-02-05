class RemoveBalanceFromResidents < ActiveRecord::Migration
  def change
    remove_column :residents, :balance
  end
end
