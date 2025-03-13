# frozen_string_literal: true

module BrewingMethodsHelper
  def brewing_method_prep_type_options
    BrewingMethod.prep_types.keys.map do |type|
      [type.humanize, type]
    end
  end
end
