class Book < ApplicationRecord
  # Set up the relationship through Authorship
  has_many :authorships, dependent: :destroy  # If a book is deleted, its authorships are also deleted
  has_many :authors, through: :authorships    # A book can have many authors through authorships

  validates :book_title, presence: true

  accepts_nested_attributes_for :authors
end
