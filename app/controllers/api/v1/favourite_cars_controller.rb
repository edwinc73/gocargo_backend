class Api::V1::FavouriteCarsController < ApplicationController
  def create
    car = params[:car_id]
    user = @current_user.id
    @favourite_car = FavouriteCar.new(user_id: user, car_id: car)
    if @favourite_car.save
      render json: { msg: 'add favourite car' }
    else
      render_error
    end
  end

  def destroy
    car = params[:car_id]
    user = @current_user.id
    @favourite_car = FavouriteCar.where(user_id: user, car_id: car)
    @favourite_car.destroy
  end

  private
  def render_error
    render json: { errors: @favourite_car.errors.full_messages },
      status: :unprocessable_entity
  end

end
