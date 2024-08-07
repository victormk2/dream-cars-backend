class Cars::IndexSerializer < ActiveModel::Serializer
  attributes :id, :model, :year, :photo, :brand

  def photo
    object.get_photo_url
  end

  def brand
    {
      id: object.brand.id,
      name: object.brand.name
    }
  end
end
