class Api::V1::BookingsController < Api::V1::BaseController
  before_action :set_booking, only: %i[show update]

  def show
    @renter = User.find(@booking.user_id)
    @car = Car.find(@booking.car_id)
    @owner = User.find(@car.user_id)
  end

  def create
    @car = Car.find(params[:id])
    @booking = Booking.new(booking_params)
    if @booking.save
      render :show
    else
      render_error
    end
  end

  def update
    if @booking.update(booking_params)
      render :show
    else
      render_error
    end
  end

  private

  def booking_params
  params.require(@booking).permit(:approved, :completed, :start_date, :return_date, :user_rating, :car_rating)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
