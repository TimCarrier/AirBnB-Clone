class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def show
    pup_dog = ""
    rate = ""

    if @dog.age <= 3
      pup_dog = "puppy"
    else
      pup_dog = "dog"
    end

    if @dog.rating <= 1
      rate = "Verybad"
    elsif @dog.rating > 1 && @dog.rating <= 2
      rate = "Bad"
    elsif @dog.rating > 2 && @dog.rating <= 3
      rate = "Good"
    elsif @dog.rating > 3 && @dog.rating <= 4
      rate = "Super"
    else
      rate = "Best"
    end
    @status = "#{rate} #{pup_dog}"
    @nreviews = rand(30..250)
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :new, status: 422
    end
  end

  def destroy
    flash[:notice] = "Post was successfully deleted" if @dog.destroy
    redirect_to root_path
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :age, :disponibility, :race, :description, :address)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
