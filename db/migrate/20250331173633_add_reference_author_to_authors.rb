class AddReferenceAuthorToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :reference_author_id, :integer
  end
end
