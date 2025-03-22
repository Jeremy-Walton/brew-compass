# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Brewing Methods', type: :system do
  let!(:user) { create(:user, :regular_user) }

  before do
    sign_in user
  end

  it 'lists brewing methods' do
    brewing_methods = create_list(:brewing_method, 3, user:)
    visit brewing_methods_path

    brewing_methods.each do |brewing_method|
      expect(page).to have_content(brewing_method.name)
    end
  end

  it 'allows a user to create a brewing_method' do
    visit brewing_methods_path
    click_on 'New Brewing Method'

    fill_in 'Name', with: 'Breville Bambino Plus'
    select BrewingMethod.prep_types[:espresso].humanize, from: 'Prep type'

    click_on 'Create Brewing method'

    expect(page).to have_content('Brewing Method was successfully created.')
    expect(BrewingMethod.first).to have_attributes(
      name: 'Breville Bambino Plus',
      prep_type: BrewingMethod.prep_types[:espresso]
    )
  end

  it 'allows a user to edit a brewing method' do
    brewing_method = create(:brewing_method, user:)
    visit brewing_methods_path

    within data_test(dom_id(brewing_method)) do
      click_on 'Edit'
    end

    fill_in 'Name', with: 'Edited Method'

    click_on 'Update Brewing method'

    expect(page).to have_content('Brewing Method was successfully updated.')
    expect(brewing_method.reload.name).to eq 'Edited Method'
  end

  it 'allows a user to delete a brewing method' do
    brewing_method = create(:brewing_method, user:)
    visit brewing_methods_path

    within data_test(dom_id(brewing_method)) do
      click_on 'Delete'
    end

    click_on 'Yes, I\'m Sure'

    expect(page).to have_content('Brewing Method was successfully deleted.')
    expect(BrewingMethod.count).to eq 0
  end
end
