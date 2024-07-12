class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :matches, foreign_key: :user_id, class_name: 'Match', dependent: :destroy
  has_many :matched_users, through: :matches, source: :matched_user

  has_many :inverse_matches, foreign_key: :matched_user_id, class_name: 'Match', dependent: :destroy
  has_many :inverse_matched_users, through: :inverse_matches, source: :user
end
