require 'rails_helper'

describe 'As a user' do
  describe 'when I create a game night i am taken to a show page for that game night' do
    before :each do
      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
    end

    it 'I can see name, date, and host name, list of invitees, list of available games' do
      json_response2 = File.read('spec/fixtures/game_night_show.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/game-nights/2")
        .to_return(status: 200, body: json_response2)

      visit '/game-nights/2'

      expect(page).to have_content('D&D')
      expect(page).to have_content('01-06-2021')
      expect(page).to have_content('10')
      expect(page).to have_content('Jake')
      expect(page).to have_content('Sean')
      expect(page).to have_link('Dungeons And Dragons')
    end
  end
end
