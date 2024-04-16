# app/controllers/cars_controller.rb
class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  def index
    @cars = Car.all
    render json: { cars: serialized_cars }
  end

  def show
    render json: @car
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      if(photo_params[:image])
        @car.photo.attach(photo_params[:image])
      end

      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      if(photo_params[:image])
        @car.photo.attach(photo_params[:image])
      end

      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.permit(:model, :year)
    end

    def photo_params
      params.permit(:image)
    end

    def serialized_cars
      ActiveModelSerializers::SerializableResource.new(
        @cars,
        each_serializer: Cars::IndexSerializer
      )
    end
end
