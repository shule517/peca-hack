class Circle < ApplicationRecord
  validates :name, presence: true
  has_many :comments
end
