class Trip < ApplicationRecord
  has_many :hotels
  has_many :flights
  belongs_to :user

  validates :budget, :origin, :date, :passengers, :booked?, presence: true
end
