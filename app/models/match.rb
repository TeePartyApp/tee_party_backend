class Match < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :matched_user, class_name: 'User'

  validates :user_id, uniqueness: { scope: :matched_user_id }
end
