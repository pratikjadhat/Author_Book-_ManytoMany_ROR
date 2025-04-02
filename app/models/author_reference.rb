class AuthorReference < ApplicationRecord
  belongs_to :author
  belongs_to :reference_author, class_name: "Author"
end
