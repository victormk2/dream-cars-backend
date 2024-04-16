class Cars::IndexSerializer < ActiveModel::Serializer
  attributes :id, :model, :year, :photo

  def photo
    object.get_photo_url
  end
end
