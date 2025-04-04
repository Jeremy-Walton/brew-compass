# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'Signing up' do
    let(:user) { build(:user) }

    it 'allows user to sign up' do
      visit new_user_registration_path

      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      fill_in 'Email', with: user.email
      fill_in 'user[password]', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'

      expect { click_on 'Sign up' }.to change(User, :count).by 1
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(User.last.first_name).to eq user.first_name
      expect(User.last.last_name).to eq user.last_name
      expect(User.last.email).to eq user.email
    end
  end

  describe 'Signing in' do
    let(:password) { 'password123' }
    let!(:user) do
      create(
        :user,
        password: password,
        password_confirmation: password
      )
    end

    it 'requires user to log in before visiting application' do
      visit root_path

      expect(page).to have_current_path(new_user_session_path)
    end

    it 'allows user to sign in' do
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
      click_on 'Log In'

      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Signed in successfully.')
    end
  end

  describe 'Signing out' do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'allows user to sign out' do
      visit root_path

      find('.menu__trigger').click
      click_on 'Log Out'

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('Log In')
    end
  end

  describe 'Editing account info' do
    let(:password) { 'password123' }
    let!(:user) do
      create(
        :user,
        password: password,
        password_confirmation: password
      )
    end
    let(:new_user_info) do
      {
        first_name: 'New',
        last_name: 'Name',
        email: 'new_email@example.com'
      }
    end

    before do
      sign_in user
    end

    it 'allows user to update account info' do
      visit root_path

      find('.menu__trigger').click
      click_on 'Settings'

      fill_in 'First name', with: new_user_info[:first_name]
      fill_in 'Last name', with: new_user_info[:last_name]
      fill_in 'Email', with: new_user_info[:email]
      fill_in 'Current password', with: password
      click_on 'Update'

      expect(user.reload.first_name).to eq new_user_info[:first_name]
      expect(user.last_name).to eq new_user_info[:last_name]
      expect(user.email).to eq new_user_info[:email]
    end
  end
end
