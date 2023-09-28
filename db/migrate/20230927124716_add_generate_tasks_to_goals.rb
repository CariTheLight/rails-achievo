class AddGenerateTasksToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :generate_tasks, :boolean
  end
end
