class CreateMotivationalQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :motivational_quotes do |t|
      t.text :text

      t.timestamps
    end
  end
end
