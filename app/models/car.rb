class Car < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :photo

  def get_photo_url
    if self.photo.attached?
      url_for(self.photo)
    end
  end
end
