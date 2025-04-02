class Author < ApplicationRecord
  # Virtual attribute for storing selected existing authors
  attr_accessor :existing_author_ids

  has_many :authorships, dependent: :destroy
  has_many :books, through: :authorships

  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :reference_author, class_name: "Author", optional: true
  accepts_nested_attributes_for :books, allow_destroy: true

  # Add a method to return full name
  def full_name
    "#{first_name} #{last_name}"
  end
end
