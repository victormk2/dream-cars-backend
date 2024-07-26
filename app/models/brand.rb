# frozen_string_literal: true

class Brand < ApplicationRecord
  # ActiveRecord
  include Rails.application.routes.url_helpers
  has_one_attached :photo

  # Relationships
  has_many :cars

  # Validations
  def validate
  end

  # Methods
  def destroy
    brand.update(active: false)
  end
end
