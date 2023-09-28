class UpdateForeignKeyConstraintForReminders < ActiveRecord::Migration[7.0]
  def change

    remove_foreign_key :reminders, :tasks if foreign_key_exists?(:reminders, :tasks)

    add_foreign_key :reminders, :tasks, on_delete: :cascade
  end
end
