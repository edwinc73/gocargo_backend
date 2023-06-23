class Api::V1::UsersController < Api::V1::BaseController
  def profile
    @user = @current_user #need to update this code to the other users.

    @favourite_cars = []
    favourite_cars_list = @user.favourite_cars
    favourite_cars_list.each do |favourite_car|
      car_id = favourite_car.car_id
      @favourite_cars << Car.find(car_id)
    end

    @bookings = @user.bookings.map do |booking|
      booking.car = Car.find(booking.car_id)
      booking
    end

    @cars = @user.cars
  end
end

#find favourite cars
#see my profile
# in profile we can see the bookings list, my cars and
