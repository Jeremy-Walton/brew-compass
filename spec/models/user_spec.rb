# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it do
      should define_enum_for(:role).with_values(
        user: 'user',
        admin: 'admin'
      ).backed_by_column_of_type(:string)
    end
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:role) }
  end

  describe '#full_name' do
    it 'returns the full name of the user' do
      user = create(:user, first_name: 'John', last_name: 'Doe')

      expect(user.full_name).to eq('John Doe')
    end
  end
end
