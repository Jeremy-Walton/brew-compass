# frozen_string_literal: true

class Brew < ApplicationRecord
  belongs_to :brewing_method
  belongs_to :bean
  belongs_to :user

  enum :rating, { one: 1, two: 2, three: 3, four: 4, five: 5 }
end
