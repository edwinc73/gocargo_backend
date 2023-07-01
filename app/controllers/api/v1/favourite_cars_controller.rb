class Api::V1::FavouriteCarsController < Api::V1::BaseController
  def create
    car = params[:car_id]
    user = @current_user.id
    @favourite_car = FavouriteCar.new(favourite_car_params)
    if @favourite_car.save
      render json: { msg: 'add favourite car' }
    else
      render_error
    end
  end

  def update
    @favourite_car = FavouriteCar.find(params[:id])
    p @favourite_car.is_favourited
    @favourite_car.update(favourite_car_params)
  end

  private
  def render_error
    render json: { errors: @favourite_car.errors.full_messages },
      status: :unprocessable_entity
  end

  def favourite_car_params
    params.require(:favourite_car).permit([:user_id, :car_id, :is_favourited])
  end

end
