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
      render :upload_img
    else
      render_error
    end
  end

  def upload_img

  end

  private

  def car_params
    params.require(:car).permit(:car_model, :mileage, :car_image, :city, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
