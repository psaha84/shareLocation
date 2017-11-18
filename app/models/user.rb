class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :friendships
  has_many :friends, -> { where(friendships: { status: "accepted" }) }, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :inverse_friends, -> { where(friendships: { status: "accepted" }) }, through: :inverse_friendships, source: :user

  has_many :pending_friends, -> { where(friendships: { status: "pending" }) }, through: :friendships, source: :friend
  has_many :requested_friends, -> { where(friendships: { status: "pending" }) }, through: :inverse_friendships, source: :user

  has_many :locations
  has_many :shared_locations
  has_many :inverse_shared_locations, class_name: "SharedLocation", foreign_key: :friend_id

  has_many :shared_locations_by_friends, through: :inverse_shared_locations, source: :location
  has_many :shared_locations_by_me, through: :shared_locations, source: :location

  def mutual_friends
    friends | inverse_friends
  end

  def has_friendship?(user)
    mutual_friends.collect(&:id).include?(user.id)
  end

  def shared_locations(current_user)
    shared_locations_by_friends | shared_locations_by_me
  end
end
