# frozen_string_literal: true

class Bean < ApplicationRecord
  validates :name, presence: true

  # TODO: Add a test for this case
  has_many :brews, dependent: :restrict_with_error
end
