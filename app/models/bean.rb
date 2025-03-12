# frozen_string_literal: true

class Bean < ApplicationRecord
  validates :name, :decaf, presence: true
end
