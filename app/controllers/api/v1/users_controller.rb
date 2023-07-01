class Api::V1::UsersController < Api::V1::BaseController
  def profile
    @user = @current_user #need to update this code to the other users.

    @favourite_cars = @user.favourite_cars.map { |f_car| f_car.car}

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
