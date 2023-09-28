class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :delete_all
end
