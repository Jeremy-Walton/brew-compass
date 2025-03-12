# frozen_string_literal: true

class Bean < ApplicationRecord
  validates :name, presence: true
end
