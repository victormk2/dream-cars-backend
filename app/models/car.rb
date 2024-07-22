class Car < ApplicationRecord
  # ActiveStorage
  include Rails.application.routes.url_helpers
  has_one_attached :photo

  # Relationships
  belongs_to :brand

  def validate
  end

  def get_photo_url
    return unless photo.attached?

    url_for(photo)
  end
end
