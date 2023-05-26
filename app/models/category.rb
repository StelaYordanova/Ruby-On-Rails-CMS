class Category < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, presence: true, length: { minimum: 2 }
  # validates :sort_order, presence: true
end
