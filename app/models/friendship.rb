class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates :status, presence: true, inclusion: { in: %w(pending declined accepted) }
end
