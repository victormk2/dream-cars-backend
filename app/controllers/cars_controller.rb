# app/controllers/cars_controller.rb
class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  def index
    @cars = Car.all
    render json: { cars: serialized_cars }
  end

  def show
    render json: {car: serialized_car}
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      handle_image
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      handle_image
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
      params[:image] = nil if params[:image] == "null"
      params.permit(:image)
    end

    def serialized_cars
      ActiveModelSerializers::SerializableResource.new(
        @cars,
        each_serializer: Cars::IndexSerializer
      )
    end

    def serialized_car
      ActiveModelSerializers::SerializableResource.new(
        @car,
        serializer: Cars::IndexSerializer
      )
    end

    def handle_image
      if(!photo_params[:image].nil?)
        @car.photo.attach(photo_params[:image])
      end

      if(photo_params[:image].nil? && @car.photo.attached?)
        @car.photo.purge
      end
    end
end
