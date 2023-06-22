class Api::V1::CarsController < Api::V1::BaseController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @owner = User.find(@car.user_id)
  end

  def create
    @car = Car.new(car_params)
    #get user id
    #@car.user = user
    if @car.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def car_params
    params.require(:car).permit(:car_model,:mileage, :car_image, :city, :price_per_day)
  end

  def render_error
    render json: { errors: @car.errors.full_messages },
      status: :unprocessable_entity
  end
end
