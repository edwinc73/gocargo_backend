class Api::V1::UsersController < Api::V1::BaseController
  def profile
    @user = User.find(1)
    #find favourite cars
    #see my profile
    # in profile we can see the bookings list, my cars and
  end
end
