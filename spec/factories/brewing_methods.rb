# frozen_string_literal: true

FactoryBot.define do
  factory :brewing_method do
    name { 'Breville Bambino Plus' }
    prep_type { BrewingMethod.prep_types[:pourover] }
  end
end
