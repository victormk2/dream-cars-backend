class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show update destroy]

  def index
    @brands = Brand.all
    render json: { brands: serialized_brands }
  end

  def show
    render json: { brand: serialized_brand }
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render json: { brand: serialized_brand, status: :created }
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  def update
    if @brand.update(brand_params)
      render json: { brand: serialized_brand }
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @brand.destroy
      render json: nil, status: :no_content
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.permit(:name, :foundation_year, :country)
  end

  def serialized_brands
    ActiveModelSerializers::SerializableResource.new(
      @brands,
      each_serializer: Brands::BrandSerializer
    )
  end

  def serialized_brand
    ActiveModelSerializers::SerializableResource.new(
      @brand,
      serializer: Brands::BrandSerializer
    )
  end
end
