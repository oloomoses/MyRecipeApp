class Chef < ActiveRecord::Base
  has_many :recipes
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :chefname, presence: true, length: { maximum: 20, minimum: 4 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: VALID_EMAIL_REGEX}
end