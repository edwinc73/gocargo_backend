class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favourite_cars
  validates :car_model, :mileage, :city, :price_per_day, presence: true
  has_many_attached :photos
end
