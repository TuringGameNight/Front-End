require 'rails_helper'

describe 'As a user' do
  describe 'when search for a game and cannot find it' do
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
    it 'I can add a new game to the app' do
      body = File.read('spec/fixtures/add_game_data.json')
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/games")
        .to_return(status: 200, body: body)

      visit new_game_path

      fill_in :name, with: 'Everdell'
      fill_in :game_type, with: 'Board game'
      fill_in :description,
              with: 'Use resources to build a village of critters and constructions in this woodland game.'
      fill_in :age_range, with: 13
      fill_in :duration, with: 80
      fill_in :image, with: 'https://boardgamegeek.com/image/3918905/everdell'

      click_on 'Suggest Game'

      expect(page).to have_content('Game created successfully and added to your shelf!')
      expect(current_path).to eq(dashboard_path)
    end

    it 'I cannot add a new game if require data (desc) missing' do
      body = File.read('spec/fixtures/add_game_data.json')
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/games")
        .to_return(status: 403, body: body)

      visit new_game_path

      fill_in :name, with: 'Everdell'
      fill_in :game_type, with: 'Board game'
      fill_in :age_range, with: 13
      fill_in :duration, with: 80
      fill_in :image, with: 'https://boardgamegeek.com/image/3918905/everdell'

      click_on 'Suggest Game'

      expect(page).to have_content('Please fill in all required fields.')
    end

    it 'I cannot add a game that already exists in the database' do
      # can we do this successfully? Should we do a "Do any of these games match?" feature?
    end
  end
end
