class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.boolean :public, null: false, default: false

      t.timestamps null: false
    end
  end
end
