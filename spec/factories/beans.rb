# frozen_string_literal: true

FactoryBot.define do
  factory :bean do
    sequence(:name) { |n| "Bean #{n}" }
    roaster { 'Happy Mug' }
    roast_date { DateTime.current }
    taste_profile { '' }
    decaf { false }
    notes { '' }
  end
end
