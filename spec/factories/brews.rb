# frozen_string_literal: true

FactoryBot.define do
  factory :brew do
    brewing_method
    bean
    user
    rating { Brew.ratings.keys.sample }
  end
end
