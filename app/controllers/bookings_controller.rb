class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show, :destroy]
  before_action :set_dog, only: [:new, :create]
  def index
    @bookings = @user.bookings
    @has_bookings = @bookings.any?
  end

  def show
    @booking = @user.bookings.find(params[:id])
  end

  def new
    @booking = Booking.new
    @taxes = (@dog.price * 0.05).round(2)
    @services_fee = (@dog.price * 0.04).round(2)
    @total = (@dog.price + @taxes + @services_fee).round(2)
    if @dog.age <= 3 && @dog.rating > 4
      @status = "Superpuppy"
    elsif @dog.age > 3 && @dog.rating > 4
      @status = "Superdog"
    elsif @dog.age > 3
      @status = "Just dog"
    else
      @status = "Just puppy"
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog
    if @booking.save
      redirect_to user_booking_path(@booking.user, @booking)
    else
      render :new, status: 422
    end
  end

  def destroy
    @booking = @user.bookings.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private
  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
