class Flight < ApplicationRecord
  belongs_to :trip
  has_one :user, through: :trip

  validates :departing_airline, :arriving_airline, :flight_price, :booked?, :flight_number, presence: true
end
