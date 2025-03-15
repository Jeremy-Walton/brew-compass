# frozen_string_literal: true

module BrewsHelper
  def brew_rating_options
    Brew.ratings.keys.map do |rating|
      [rating.humanize, rating]
    end
  end
end
