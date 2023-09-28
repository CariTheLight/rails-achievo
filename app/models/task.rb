class Task < ApplicationRecord
  belongs_to :goal

  validates :name, :description, presence: true, uniqueness: true
end
