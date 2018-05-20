class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_secure_password

  enum role: {member: 0, admin: 1}
end
