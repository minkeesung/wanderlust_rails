class Hotel < ApplicationRecord
  belongs_to :trip
  has_one :user, through: :trip

  validates :name, :price, :booked?, presence: true
  
end
