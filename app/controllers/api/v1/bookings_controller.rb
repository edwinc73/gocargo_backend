class Api::V1::BookingsController < Api::V1::BaseController
  before_action: :set_booking, only: %i[show]

  def show
    render json: @booking #Just for testing
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
