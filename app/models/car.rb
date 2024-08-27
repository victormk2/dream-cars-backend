class Car < ApplicationRecord
  # ActiveStorage
  include Rails.application.routes.url_helpers
  has_one_attached :photo

  # Relationships
  belongs_to :brand
  belongs_to :engine, optional: true

  def validate
  end

  def get_photo_url
    return unless photo.attached?

    url_for(photo)
  end

  def destroy
    update(deleted_at: Time.now, active: false)
  end

  def set_brand(brand_id)
    self.brand = Brand.find(brand_id)
  end
end
