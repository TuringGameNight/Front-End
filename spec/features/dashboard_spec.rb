require 'rails_helper'

describe 'As an authenticated user' do
  describe 'after logging in I see my user dashboard' do
    it 'has a welcome message, a list of my game nights, a list of my games and a list of my friends' do
      visit dashboard_index_path

      expect(page).to have_css("#welcome-message")
      expect(page).to have_css("#user-games")
      expect(page).to have_css("#game-nights")
      expect(page).to have_css("#friends")
    end
  end
end
