class AddUserForeignKeysToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_column :followings, :follower_id, :integer
    add_column :followings, :followed_id, :integer

    add_index :followings, :follower_id
    add_index :followings, :followed_id
  end
end
