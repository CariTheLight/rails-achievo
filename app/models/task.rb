class Task < ApplicationRecord
  belongs_to :goal
  has_many :journal_entries

  # validates :name, presence: true

  validates :description, presence: true
  has_many :reminders, dependent: :delete_all


end
