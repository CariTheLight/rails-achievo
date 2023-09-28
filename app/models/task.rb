class Task < ApplicationRecord
  belongs_to :goal

  validates :name, presence: true
  validates :description, presence: true
end
