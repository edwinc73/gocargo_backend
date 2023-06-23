class Api::V1::CarsController < Api::V1::BaseController
  before_action :set_car, only: [ :show ]
  def index
    @cars = Car.all
  end

  def show
    @owner = User.find(@car.user_id)
  end

  def create
    @car = Car.new(car_params)
    @car.user = User.last
    if @car.save
      redirect_to api_v1_car_path(@car), status: 303
    else
      render_error
    end
  end

  private

  def car_params
<<<<<<< HEAD
    params.require(:car).permit(:car_model,:mileage, :car_image, :city, :price_per_day)
  end

  def render_error
    render json: { errors: @car.errors.full_messages },
      status: :unprocessable_entity
=======
    params.require(:car).permit(:car_model, :mileage, :car_image, :city, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
>>>>>>> master
  end
end
