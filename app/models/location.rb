class Location < ActiveRecord::Base
  belongs_to :user
  scope :shared, -> { where(public: true) }
end
