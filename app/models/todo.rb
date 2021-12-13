class Todo < ApplicationRecord
  validates :title, presence: true

  enum status: { in_progress: 0, done: 1 }
end
