class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favourite_cars
  validates :car_model, presence: true
  validates :mileage, presence: true
  validates :city, presence: true
  validates :price_per_day, presence: true
end
