class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index

    if params[:query].present?
      @dogs = Dog.search_by_name_and_race(params[:query])
    else
      @dogs = Dog.all
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end

    @dog = Dog.new

  end

  def show
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
