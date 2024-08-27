# frozen_string_literal: true

class Engine < ApplicationRecord # rubocop:disable Style/Documentation
  # ActiveStorage
  include Rails.application.routes.url_helpers
  has_one_attached :photo

  # Relationships
  has_many :cars
end
