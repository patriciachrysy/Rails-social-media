require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Athentication process', type: :system do
  describe 'access signup page' do
    it 'shows the right content' do
      visit sign_up_path
      expect(page).to have_content('Sign up')
    end
  end

  describe 'signup a new user' do
    before(:each) do
      visit sign_up_path
    end

    it 'Redirect to homepage' do
      fill_in 'Fullname', with: 'Capybara Testor'
      fill_in 'Username', with: 'Capybara'
      page.attach_file('user_photo', Rails.root + 'app/assets/images/article-image3.jpg')
      page.attach_file('user_cover_image', Rails.root + 'app/assets/images/control-remedy.jpg')
      click_on 'Done'
      expect(page).to have_content('Capybara Testor')
    end

    it 'Does not redirect to homepage if the username is already taken' do
      fill_in 'Fullname', with: 'Capybara Testor'
      fill_in 'Username', with: 'Capybara'
      page.attach_file('user_photo', Rails.root + 'app/assets/images/article-image3.jpg')
      page.attach_file('user_cover_image', Rails.root + 'app/assets/images/control-remedy.jpg')
      click_on 'Done'

      visit sign_out_path

      visit sign_up_path

      fill_in 'Fullname', with: 'Capybara Testor'
      fill_in 'Username', with: 'Capybara'
      page.attach_file('user_photo', Rails.root + 'app/assets/images/article-image3.jpg')
      page.attach_file('user_cover_image', Rails.root + 'app/assets/images/control-remedy.jpg')
      click_on 'Done'
      expect(page).to have_content('Username has already been taken')
    end
  end

  describe 'Sign a user in' do
    it 'Redirect to homepage' do
      visit sign_up_path
      fill_in 'Fullname', with: 'Capybara Testor'
      fill_in 'Username', with: 'Capybara'
      page.attach_file('user_photo', Rails.root + 'app/assets/images/article-image3.jpg')
      page.attach_file('user_cover_image', Rails.root + 'app/assets/images/control-remedy.jpg')
      click_on 'Done'

      visit sign_out_path

      visit sign_in_path
      fill_in 'username', with: 'Capybara'
      click_on 'Hop in'
      expect(page).to have_content('Capybara Testor')
    end

    it 'Does not redirect to homepage when the username does not exist' do
      visit sign_up_path
      fill_in 'Fullname', with: 'Capybara Testor'
      fill_in 'Username', with: 'Capybara'
      page.attach_file('user_photo', Rails.root + 'app/assets/images/article-image3.jpg')
      page.attach_file('user_cover_image', Rails.root + 'app/assets/images/control-remedy.jpg')
      click_on 'Done'

      visit sign_out_path

      visit sign_in_path
      fill_in 'username', with: 'capybara'
      click_on 'Hop in'
      expect(page).to have_content('Incorrect username, please try again or sign up if you do not have an account.')
    end
  end
end
