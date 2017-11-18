class CreateFriendships < ActiveRecord::Migration
  def up
    create_table :friendships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.string :status, null: false, default: "pending"

      t.timestamps null: false
    end

    add_foreign_key :friendships, :users
    add_foreign_key :friendships, :users, column: :friend_id
  end

  def down
    drop_table :friendships
  end
end
