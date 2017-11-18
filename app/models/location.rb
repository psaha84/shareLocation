class Location < ActiveRecord::Base
  belongs_to :user
  has_many :shared_locations

  scope :public_to_all, -> { where(public: true) }

  def shared_locations_with_friends(friend_ids)
    shared_locations.destroy_all
    user.friends.where(id: friend_ids).map do |friend|
      shared_locations.create(friend_id: friend.id, user_id: user.id)
    end
  end

  def as_json(options = { })
    h = super(options)
    h[:friend_ids] = shared_locations.pluck(:friend_id)
    h
  end
end
