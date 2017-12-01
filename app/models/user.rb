class User < ApplicationRecord
  has_secure_password
  validates :first_name, length: { minimum: 2 }, presence: true
  validates :last_name, length: { minimum: 2 }, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :messages, dependent: :destroy
end
