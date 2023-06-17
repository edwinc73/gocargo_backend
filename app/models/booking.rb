class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, presence: true
  validates :return_date, presence: true
  validates :total_price, presence: true
end
