class User < ApplicationRecord
  has_many :trips
  has_many :hotels, through: :trips, foreign_key: "hotel_id"
  has_many :flights, through: :trips, source: :flights
  validates :name, :email, :password, presence: true, length: {minimum: 5}

  has_secure_password
end
