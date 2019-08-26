class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :contact, presence: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

#  Created password_digest field but while submitting
#  We need to send password and password_confirmation field from UI
end