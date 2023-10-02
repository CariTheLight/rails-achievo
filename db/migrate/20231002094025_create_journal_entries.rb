class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.text :entry_text
      t.date :entry_date

      t.timestamps
    end
  end
end
