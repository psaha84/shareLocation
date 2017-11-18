class CreateSharedLocations < ActiveRecord::Migration
  def change
    create_table :shared_locations do |t|
      t.integer :location_id
      t.integer :friend_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :shared_locations, :locations
    add_foreign_key :shared_locations, :users
    add_foreign_key :shared_locations, :users, column: :friend_id
  end
end
