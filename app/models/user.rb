class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :nullify

  validates :email, presence: true, uniqueness: true
  validates_email_format_of :email

  validates :name, presence: true
  validates :password_digest, presence: true, length: { minimum: 8 }
end
