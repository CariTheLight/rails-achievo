class ChangeGoalColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :goals, :timeline, :date
    add_column :goals, :start_date, :date
    add_column :goals, :end_date, :date
  end
end
