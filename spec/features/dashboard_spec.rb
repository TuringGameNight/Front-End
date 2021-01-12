require 'rails_helper'

describe 'As an authenticated user' do
  describe 'after logging in I see my user dashboard' do
    before :each do
      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
      json = JSON.parse(json_response1, symbolize_names: true)
      user = User.new(json)
      friends = json[:data][:relationships][:friends][:data].map do |data|
        Friend.new(data)
      end
      games = json[:data][:relationships][:games][:data].map do |data|
        Game.new(data)
      end
      game_nights = json[:data][:relationships][:game_nights][:data].map do |data|
        GameParty.new(data)
      end
      user.add_friends(friends)
      user.add_games(games)
      user.add_game_nights(game_nights)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
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

    it 'If I am not logged in, I am taken to the homepage' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      visit '/dashboard'

      expect(current_path).to eq('/')

      visit '/game-nights/new'

      expect(current_path).to eq('/')

      visit '/game-nights/2'

      expect(current_path).to eq('/')

      visit '/games/search'

      expect(current_path).to eq('/')

      visit '/games/search/results'

      expect(current_path).to eq('/')
    end
  end
end
