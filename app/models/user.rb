class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :friendships
  has_many :friends, -> { where(friendships: { status: "accepted" }) }, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :inverse_friends, -> { where(friendships: { status: "accepted" }) }, through: :inverse_friendships, source: :user

  has_many :pending_friends, -> { where(friendships: { status: "pending" }) }, through: :friendships, source: :friend
  has_many :requested_friends, -> { where(friendships: { status: "pending" }) }, through: :inverse_friendships, source: :user

  def mutual_friends
    friends | inverse_friends
  end

  def has_friendship?(user)
    mutual_friends.collect(&:id).include?(user.id)
  end
end
