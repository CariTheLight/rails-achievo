class AddProgressToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :progress, :integer
  end
end
