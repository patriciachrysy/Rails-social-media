class AddAuthorIdAndOpinionIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :author_id, :integer
    add_column :comments, :opinion_id, :integer
    
    add_index :comments, :author_id
    add_index :comments, :opinion_id
  end
end
