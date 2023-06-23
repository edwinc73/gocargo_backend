class Api::V1::BookingsController < Api::V1::BaseController
  before_action :set_booking, only: %i[show update]

  def index
    @user = @current_user
    # find the user
    @booking_renter = @user.bookings
    @booking_owner = Booking.all.select { |b| b.car.user == @user }
  end

  def show
    @renter = User.find(@booking.user_id)
    @car = Car.find(@booking.car_id)
    @owner = User.find(@car.user_id)
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = @current_user
    if @booking.save
      redirect_to api_v1_booking_path(@booking), status: 303
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
    params.require(:booking).permit(:approved, :completed, :start_date, :return_date, :total_price, :user_rating, :car_rating)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },
      status: :unprocessable_entity
  end
end
