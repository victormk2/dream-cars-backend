class EnginesController < ApplicationController

  def index
    @engines = Engine.all
  end

  def show
    @engine = Engine.find(params[:id])
    @engine.run
  end

  def create
    @engine = Engine.new(engine_params)

    if @engine.save
      redirect_to @engine
    else
      render :new
    end
  end

  private

  def engine_params
    params.require(:engine).permit(:model, :description, :year)
  end
end
