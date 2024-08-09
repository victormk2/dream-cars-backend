# frozen_string_literal: true

class Brand < ApplicationRecord
  # ActiveRecord
  include Rails.application.routes.url_helpers
  has_one_attached :photo

  # Relationships
  has_many :cars

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :foundation_year, presence: true

  validate :validate_foundation_year

  def destroy
    update(deleted_at: Time.now, active: false)
  end

  def validate_foundation_year
    errors.add(:foundation_year, 'must be a valid year') if foundation_year < 1900 || foundation_year > Time.now.year
  end
end
