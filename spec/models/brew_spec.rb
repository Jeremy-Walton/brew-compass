# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Brew, type: :model do
  describe 'associations' do
    it { should belong_to(:brewing_method) }
    it { should belong_to(:bean) }
  end

  describe 'validations' do
    it do
      should define_enum_for(:rating).with_values(
        one: 1,
        two: 2,
        three: 3,
        four: 4,
        five: 5
      ).backed_by_column_of_type(:integer)
    end
  end
end
