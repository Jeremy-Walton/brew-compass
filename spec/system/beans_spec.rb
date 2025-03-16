# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Beans', type: :system do
  let!(:user) { create(:user, :regular_user) }

  before do
    sign_in user
  end

  it 'lists beans' do
    beans = create_list(:bean, 3)
    visit beans_path

    beans.each do |bean|
      expect(page).to have_content(bean.name)
    end
  end

  it 'allows a user to create a bean' do
    visit beans_path
    click_on 'New Bean'

    fill_in 'Name', with: 'Test Bean'
    fill_in 'Roaster', with: 'Test Roaster'
    fill_in 'Roast date', with: DateTime.current
    fill_in 'Taste profile', with: 'Test Taste Profile'
    check 'Decaf'
    fill_in 'Notes', with: 'Test Notes'

    click_on 'Create Bean'

    expect(page).to have_content('Bean was successfully created.')
    expect(Bean.first).to have_attributes(
      name: 'Test Bean',
      roaster: 'Test Roaster',
      taste_profile: 'Test Taste Profile',
      decaf: true,
      notes: 'Test Notes'
    )
  end

  it 'allows a user to edit a bean' do
    bean = create(:bean)
    visit beans_path

    within data_test(dom_id(bean)) do
      click_on 'Edit'
    end

    fill_in 'Name', with: 'Edited Bean'

    click_on 'Update Bean'

    expect(page).to have_content('Bean was successfully updated.')
    expect(bean.reload.name).to eq 'Edited Bean'
  end

  it 'allows a user to delete a bean' do
    bean = create(:bean)
    visit beans_path

    within data_test(dom_id(bean)) do
      click_on 'Delete'
    end

    click_on 'Yes, I\'m Sure'

    expect(page).to have_content('Bean was successfully deleted.')
    expect(Bean.count).to eq 0
  end
end
