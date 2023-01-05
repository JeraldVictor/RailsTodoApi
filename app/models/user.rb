class User < ApplicationRecord
  # Relation
  has_many :todos

  # Email to lower case
  before_save { self.email = email.downcase() }

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with:   /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: 'Invalid email' }
end
