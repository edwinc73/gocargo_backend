class Api::V1::CarsController < Api::V1::BaseController
  def index
    @cars = Car.all
    render json: @cars #Just for testing
  end
end
