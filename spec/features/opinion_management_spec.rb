require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Opinion management', type: :system do
  describe 'Manage opinions' do
    before(:each) do
      visit sign_up_path
      fill_in 'Fullname', with: 'Capybara Testor'
      fill_in 'Username', with: 'Capybara'
      page.attach_file('user_photo', Rails.root + 'app/assets/images/article-image3.jpg')
      page.attach_file('user_cover_image', Rails.root + 'app/assets/images/control-remedy.jpg')
      click_on 'Done'
    end

    it 'Access the create opinion form' do
      expect(page).to have_content('Book name')
    end

    it 'Create a new review, should redirect to root page if all is ok' do
      fill_in 'Book name', with: 'Capybara Testing Book'
      fill_in 'Book author', with: 'Capybara'
      fill_in 'Published at', with: DateTime.now
      fill_in 'opinion_content', with: 'It has been referred to as the greatest love story of
       all time, or perhaps the most tragic. Romeo and Juliet serves to satisfy both anyway,
       which for a 1595 play has obviously stuck around for a very long time, which points to how
       good a book can turn out to be centuries after its author graced our good planet.'
      click_on 'Done'
      expect(page).to have_content('Capybara Testing Book')
    end

    it 'Show a review, should redirect to review page' do
      fill_in 'Book name', with: 'Capybara Testing Book'
      fill_in 'Book author', with: 'Capybara'
      fill_in 'Published at', with: DateTime.now
      fill_in 'opinion_content', with: 'It has been referred to as the greatest love
      story of all time, or perhaps the most tragic. Romeo and Juliet serves to satisfy both anyway,
       which for a 1595 play has obviously stuck around for a very long time, which points to how
       good a book can turn out to be centuries after its author graced our good planet.'
      click_on 'Done'

      expect(page).to have_content('Capybara Testing Book')
    end
  end
end
