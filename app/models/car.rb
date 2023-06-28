class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favourite_cars
  has_many_attached :photos
  validates :car_model, :car_brand, :mileage, :city, :price_per_day, presence: true
end
