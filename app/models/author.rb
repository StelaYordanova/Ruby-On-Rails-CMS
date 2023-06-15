class Author < ApplicationRecord
    has_many :books, dependent: :restrict_with_error
    validates :name, presence: true, length: { minimum: 2 }
end
