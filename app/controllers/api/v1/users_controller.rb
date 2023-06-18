class Api::V1::UsersController < Api::V1::BaseController
  def profile
    @user = User.find(1)
    @favourite_cars = []
    favourite_cars_list = @user.favourite_cars
    favourite_cars_list.each do |favourite_car|
      car_id = favourite_car.car_id
      @favourite_cars << Car.find(car_id)
    end
  end
end

#find favourite cars
#see my profile
# in profile we can see the bookings list, my cars and
