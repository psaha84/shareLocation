class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates :status, presence: true, inclusion: { in: %w(pending declined accepted) }

  scope :accepted, -> { where(status: "accepted") }
  scope :pending, -> { where(status: "pending") }

  def accept
    update_attribute(:status, "accepted")
  end
end
