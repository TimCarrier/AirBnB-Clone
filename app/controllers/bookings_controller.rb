class BookingsController < ApplicationController
  before_action :set_user, only: [:index, :show, :destroy ]
  before_action :set_dog, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]
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
    flash[:notice] = "Booking was successfully deleted." if @booking.destroy
    redirect_to root_path
  end

  private
  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

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
