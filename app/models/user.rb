class User < ApplicationRecord
  has_many :cars
  has_many :bookings
  has_many :favourite_cars
end
