class AddGoalIdToJournal < ActiveRecord::Migration[7.0]
  def change
    add_reference :journals, :goal, null: false, foreign_key: true
  end
end
