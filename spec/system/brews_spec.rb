# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Brewings', type: :system do
  let!(:user) { create(:user, :regular_user) }
  let!(:brewing_method) { create(:brewing_method, name: 'Demo Method') }
  let!(:bean) { create(:bean) }

  before do
    sign_in user
  end

  it 'lists brews' do
    brews = create_list(:brew, 3)
    visit brews_path

    brews.each do |brew|
      expect(page).to have_content(brew.created_at.strftime('%B %d, %Y'))
    end
  end

  it 'allows a user to create a brew', :js do
    visit brews_path
    click_on 'New Brew'

    select brewing_method.name, from: 'Brewing method'
    select bean.name, from: 'Bean'
    shoelace_select_rating('brew_rating', 'five')

    click_on 'Create Brew'

    expect(page).to have_content('Brew was successfully created.')
    expect(Brew.first).to have_attributes(
      brewing_method: brewing_method,
      bean: bean,
      rating: 'five'
    )
  end

  it 'allows a user to edit a brew' do
    brew = create(:brew)
    visit brews_path

    within data_test(dom_id(brew)) do
      click_on 'Edit'
    end

    select brewing_method.name, from: 'Brewing method'

    click_on 'Update Brew'

    expect(page).to have_content('Brew was successfully updated.')
    expect(brew.reload.brewing_method).to eq brewing_method
  end

  it 'allows a user to delete a brew' do
    brew = create(:brew)
    visit brews_path

    within data_test(dom_id(brew)) do
      click_on 'Delete'
    end

    click_on 'Yes, I\'m Sure'

    expect(page).to have_content('Brew was successfully deleted.')
    expect(Brew.count).to eq 0
  end
end
