class AddAttributesToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :status, :boolean
    add_column :goals, :resources, :string
    add_column :goals, :time_available, :string
  end
end
