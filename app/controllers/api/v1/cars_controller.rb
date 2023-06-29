class Api::V1::CarsController < Api::V1::BaseController
  before_action :set_car, only: [ :show]
  def index
    @cars = Car.all
  end

  def show
    @owner = User.find(@car.user_id)
  end

  def create
    @car = Car.new(car_params)
    @car.user = @current_user
    if @car.save
      redirect_to api_v1_car_path(@car), status: 303
    else
      render_error
    end
  end

  def upload_img
    @car = Car.last
    photo = params[:photos]
    @car.photos.attach(io:photo.tempfile, filename:photo.original_filename)
    @car.save!
  end

  private

  # def img_params
  #   params.require(:car).permit(:photos)
  # end

  # def car_params
  #   params.require(:photod).permit(:car_model, :mileage, :car_image, :city, :price_per_day, :car_brand, :photos, photos: [])
  # end

  def car_params
    params.require(:car).permit(:car_model, :mileage, :car_image, :city, :price_per_day, :car_brand, :photos)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
