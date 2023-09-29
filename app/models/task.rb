class Task < ApplicationRecord
  belongs_to :goal
  has_many :reminders, dependent: :delete_all
end
