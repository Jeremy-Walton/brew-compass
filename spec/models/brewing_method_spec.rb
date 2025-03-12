require 'rails_helper'

RSpec.describe BrewingMethod, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it do
      should define_enum_for(:prep_type).with_values(
        espresso: 'espresso',
        aeropress: 'aeropress',
        drip: 'drip',
        chemex: 'chemex',
        pourover: 'pourover',
        other: 'other'
      ).backed_by_column_of_type(:string)
    end
  end
end
