class Transaction < ApplicationRecord
  belongs_to :user

  def self.user(user_id)
    where(user_id: user_id)
  end
end
