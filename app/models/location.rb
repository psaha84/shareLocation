class Location < ActiveRecord::Base
  belongs_to :user
  has_many :shared_locations

  scope :public_to_all, -> { where(public: true) }

  def shared_locations_with_friends(friend_ids)
    user.friends.where(id: friend_ids).each do |friend|
      shared_locations.create(friend_id: friend.id, user_id: user.id)
    end
  end
end
