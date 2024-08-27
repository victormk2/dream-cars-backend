class Engines::EngineSerializer < ActiveModel::Serializer
  attributes :id, :name, :power, :cylinders, :created_at, :updated_at, :active
end
