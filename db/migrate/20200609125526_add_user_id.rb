class AddUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :likings, :user_id, :integer
    add_column :likings, :opinion_id, :integer
    
    add_index :likings, :user_id
    add_index :likings, :opinion_id
  end
end
