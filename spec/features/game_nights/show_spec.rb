require 'rails_helper'

describe 'As a user' do
  describe 'When I create a game night, I am taken to a show page for that game night' do
    before :each do
      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
      json = JSON.parse(json_response1, symbolize_names: true)
      user = User.new(json)

      friends_response = File.read('spec/fixtures/new_friends_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/friends")
        .to_return(status: 200, body: friends_response)

      games_response = File.read('spec/fixtures/new_user_games.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/games")
        .to_return(status: 200, body: games_response)

      game_nights_response = File.read('spec/fixtures/new_users_game_nights.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/game_nights")
        .to_return(status: 200, body: game_nights_response)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'I can see name, date, and host name, list of invitees, list of available games' do
      json_response2 = File.read('spec/fixtures/game_night_show.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/game_nights/2")
        .to_return(status: 200, body: json_response2)

      visit '/game-nights/2'

      expect(page).to have_content('Gloomhaven')
      expect(page).to have_content('2021-01-22')
      expect(page).to have_content('1')
      expect(page).to have_content('Phil')

      expect(page).to have_link('Gloomhaven')
    end
    # Sad path idea is to ensure people that are not a
    # part of the game night can't see the game night details
  end
end
