# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bean, type: :model do
  describe 'associations' do
    it { should have_many(:brews).dependent(:restrict_with_error) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
