# frozen_string_literal: true

class Bean < ApplicationRecord
  validates :name, presence: true

  has_many :brews, dependent: :restrict_with_error
end
