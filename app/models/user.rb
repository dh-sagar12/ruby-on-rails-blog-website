class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  before_save {
    self.email = email.downcase
  }

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6, maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :full_name, presence: true, length: { minimum: 6, maximum: 50 }
  has_many :articles
  has_many :categories, foreign_key: :creator_id

  has_secure_password
end
