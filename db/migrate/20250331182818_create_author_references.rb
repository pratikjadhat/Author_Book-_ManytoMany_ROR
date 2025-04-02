class CreateAuthorReferences < ActiveRecord::Migration[7.1]
  def change
    create_table :author_references do |t|
      t.integer :author_id
      t.integer :reference_author_id

      t.timestamps
    end
  end
end
