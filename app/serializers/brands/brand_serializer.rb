class Brands::BrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :foundation_year, :country, :created_at, :updated_at, :active
end
