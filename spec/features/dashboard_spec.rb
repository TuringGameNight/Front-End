require 'rails_helper'

describe 'As an authenticated user' do
  describe 'after logging in I see my user dashboard' do
    before :each do
      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
    end

    it 'I see a welcome message, a list of my game nights, a list of my games and a list of my friends' do
      visit dashboard_path

      within('#welcome-message') do
        expect(page).to have_content('Welcome Jake!')
      end

      within('#user-games') do
        expect(page).to have_content('Dungeons & Dragons')
        expect(page).to have_content('Pandemic')
        expect(page).to have_button('Add a Game')
      end

      within('#game-nights') do
        expect(page).to have_content('Dwarves Rule 2021')
        expect(page).to have_button('Add a Game Night')
      end

      within('#friends') do
        expect(page).to have_content('Sean')
        expect(page).to have_content('Robert')
        expect(page).to have_button('Add Friend')
      end
    end

    xit 'If I am not logged in, I am taken to the homepage' do
    end
  end
end
