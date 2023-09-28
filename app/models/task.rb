class Task < ApplicationRecord
  belongs_to :goal

  validates :name, :description, presence: true, uniqueness: true

  has_many :reminders, dependent: :delete_all

end
