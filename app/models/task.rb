class Task < ApplicationRecord
  belongs_to :goal
  # validates :name, presence: true

  validates :description, presence: true
  has_many :reminders, dependent: :delete_all
end
