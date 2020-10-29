class User < ApplicationRecord
  has_secure_password

  has_many :cities, dependent: :destroy

  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
end
