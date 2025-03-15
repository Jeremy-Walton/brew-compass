# frozen_string_literal: true

class BrewingMethod < ApplicationRecord
  enum :prep_type, {
    espresso: 'espresso',
    aeropress: 'aeropress',
    drip: 'drip',
    chemex: 'chemex',
    pourover: 'pourover',
    other: 'other'
  }, validate: true

  validates :name, presence: true

  # TODO: Add a test for this case
  has_many :brews, dependent: :restrict_with_error
end
