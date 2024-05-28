class BookingsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_booking, only: [:show]
  def index
    @bookings = @user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
  end

  def destroy
    flash[:notice] = "User was successfully destroyed." if @user.destroy
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
