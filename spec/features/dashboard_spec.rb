require 'rails_helper'

describe 'As an authenticated user' do
  describe 'after logging in I see my user dashboard' do
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

        game_night_invites_response = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/invitations")
        .to_return(status: 200, body: game_night_invites_response)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'I see a welcome message, a list of my game nights, a list of my games and a list of my friends' do
      visit dashboard_path

      within('.welcome-name') do
        expect(page).to have_content('Welcome Jake!')
      end

      within('#user-games') do
        expect(page).to have_content('Pandemic')
        expect(page).to have_button('Add a Game')
      end

      within('#game-nights') do
        expect(page).to have_content('PostgreSQL 13')
        expect(page).to have_button('Add a Game Night')
        save_and_open_page
      end

      within('#friends') do
        expect(page).to have_content('Phil')
        expect(page).to have_button('Add Friend')
      end

      within('.invitations') do
        expect(page).to have_content('Brad Gamer')
        expect(page).to have_content("Pandemic Legacy Season 2: Episode 3")
        expect(page).to have_content("01-16-2021")
        expect(page).to have_content("3")
        expect(page).to have_button("Accept")
        expect(page).to have_button("Decline")
        save_and_open_page
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
