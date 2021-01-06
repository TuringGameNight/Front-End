require 'rails_helper'

describe 'As a user' do
  describe 'when I visit the root path' do
    it 'has the name of the application, the description and a link to sign in with google' do
      visit root_path

      within "#title" do
        expect(page).to have_content("Game Night")
      end

      within "#description" do
        expect(page).to have_content("Stop leaving organizing a game night to a roll of the dice. Game Night will have you and your friends playing your favorite board games in no time.")
      end

      within "#auth-link" do
        expect(page).to have_button("Login with Google")
      end
    end
  end
end
