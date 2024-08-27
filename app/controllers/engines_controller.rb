class EnginesController < ApplicationController
  before_action :set_engine, only: %i[show update delete]

  def index
    @engines = Engine.all
    render json: { engines: serialized_engines }
  end

  def show
    render json: { engine: serialized_engine }
  end

  def create
    @engine = Engine.new(engine_params)

    if @engine.save
      render json: { engine: serialized_engine }, status: :created
    else
      render json: @engine.errors, status: :unprocessable_entity
    end
  end

  def update
    @engine = Engine.find(params[:id])

    if @engine.update(engine_params)
      render json: { engine: serialized_engine }, status: :ok
    else
      render json: @engine.errors, status: :unprocessable_entity
    end
  end

  def delete
    @engine = Engine.find(params[:id])
    @engine.destroy

    render json: nil, status: :no_content
  end

  private

  def engine_params
    params.require(:engine).permit(:model, :description, :year, :cylinders)
  end

  def set_engine
    @engine = Engine.find(params[:id])
  end

  def serialized_engines
    ActiveModelSerializers::SerializableResource.new(
      @engines,
      each_serializer: Engines::EngineSerializer
    )
  end

  def serialized_engine
    ActiveModelSerializers::SerializableResource.new(
      @engine,
      serializer: Engines::EngineSerializer
    )
  end
end
