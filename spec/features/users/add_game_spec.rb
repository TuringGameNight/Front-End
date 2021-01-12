require 'rails_helper'

describe 'As a user' do
  describe 'When I visit my dashboard and search for a game' do
    describe 'I see a list of results' do
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
      it 'Next to each game, I see a button to add the game to my collection' do
        visit '/dashboard'

        json_response2 = File.read('spec/fixtures/games_search_data.json')
        stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/games/find?search=Catan")
          .to_return(status: 200, body: json_response2)

        json_response3 = File.read('spec/fixtures/users_add_game.json')
        stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/users/games")
          .to_return(status: 200, body: json_response3)

        within('#user-games') do
          click_on 'Add a Game'
        end

        fill_in :search, with: 'Catan'
        click_on 'Search for Games'

        within '#game-4' do
          expect(page).to have_button('+')
          click_on '+'
        end
      end

      it 'I cannot add a game that is already on my shelf of games' do
        visit '/dashboard'

        json_response2 = File.read('spec/fixtures/games_search_data.json')
        stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/games/find?search=Catan")
          .to_return(status: 200, body: json_response2)

        json_response3 = File.read('spec/fixtures/users_add_game.json')
        stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/users/games")
          .to_return(status: 403, body: json_response3)

        within('#user-games') do
          click_on 'Add a Game'
        end

        fill_in :search, with: 'Catan'
        click_on 'Search for Games'

        within '#game-4' do
          expect(page).to have_button('+')
          click_on '+'
        end
        expect(page).to have_content('Something went wrong. Please try again.')
      end
    end
  end
end
