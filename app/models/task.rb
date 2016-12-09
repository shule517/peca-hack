class Task < ApplicationRecord
  belongs_to :project
  scope :unfinished, -> { where(done: false) }
end
