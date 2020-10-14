class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :username, :first_name, :last_name, :password_digest
end
