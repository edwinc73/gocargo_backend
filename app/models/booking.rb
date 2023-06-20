class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :return_date, :total_price, presence: true
end
