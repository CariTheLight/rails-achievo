class AddOrderToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :order, :integer, :default: -1
  end
end
