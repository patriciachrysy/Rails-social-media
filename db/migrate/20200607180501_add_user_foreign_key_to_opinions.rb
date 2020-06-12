class AddUserForeignKeyToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :author_id, :integer
    
    add_index :opinions, :author_id
  end
end
