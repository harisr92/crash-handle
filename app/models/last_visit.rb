class LastVisit < ApplicationRecord
  belongs_to :user

  scope :user, ->(user_id) { where(user_id: user_id) }
end
