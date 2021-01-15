require 'rails_helper'
describe 'as an authenticated user' do
  describe 'I can add a friend on my user dashboard page' do
    before :each do
      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
      json = JSON.parse(json_response1, symbolize_names: true)
      user = User.new(json)

      json_response2 = File.read('spec/fixtures/user_2_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
      json_2 = JSON.parse(json_response1, symbolize_names: true)
      @user_2 = User.new(json_2)

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

    it 'when I successfully add a friend by email I see them listed as a pending friend in my list of friends' do
      
    end

    it 'when I am added by someone else I see them listed as pending friends with an accept and decline button' do

    end

    it 'when I try to add myself as a friend I see an error message' do

    end

    it 'when I try to add a friend not in the database I see an error message' do

    end

    it 'when I try to add a friend more than once I see an error message' do

    end
  end
end
