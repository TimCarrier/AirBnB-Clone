class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show, :destroy]
  before_action :set_dog, only: [:new, :create]
  def index
    @bookings = @user.bookings
    @has_bookings = @bookings.any?
  end

  def show
    unless @user.bookings.exists?(params[:id])
      redirect_to user_bookings_path(@user), alert: "You don't have access to this booking"
    else
      @booking = @user.bookings.find(params[:id])
    end
    @marker = {
      lat: @booking.dog.latitude,
      lng: @booking.dog.longitude}
  end

  def new
    @booking = Booking.new
    if @dog.price
      @taxes = (@dog.price * 0.05).round(2)
      @services_fee = (@dog.price * 0.04).round(2)
      @total = (@dog.price + @taxes + @services_fee).round(2)
    else
      @taxes = 1.5
      @services_fee = 0.7
      @total = @taxes + @services_fee + 10
    end
    if @dog.rating
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
    @buddies = (10..50).to_a.sample
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
