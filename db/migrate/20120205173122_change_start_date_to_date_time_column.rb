class ChangeStartDateToDateTimeColumn < ActiveRecord::Migration
  def change
    rename_column :chore_instances, :start, :start_date
    rename_column :chore_instances, :end, :end_date
    
    change_column :chores, :start_date, :date
    change_column :chore_instances, :start_date, :date
    change_column :chore_instances, :end_date, :date
  end
end
