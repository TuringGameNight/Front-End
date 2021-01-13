require 'rails_helper'

describe 'As a user' do
  describe 'When I visit my dashboard and click to add a game to my account' do
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
    it 'When I click on this button, I am taken to a form to search for the game' do
      visit '/dashboard'

      within('#user-games') do
        click_on 'Add a Game'
      end

      expect(current_path).to eq('/games/search')
      fill_in :search, with: 'Catan'
      expect(find_field(:search).value).to eq('Catan')
    end
    it 'When I fill in this form with my search and submit it, I am taken to a results page where I see a list of games' do
      visit '/dashboard'

      json_response2 = File.read('spec/fixtures/games_search_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/games/find?name=Catan")
        .to_return(status: 200, body: json_response2)

      within('#user-games') do
        click_on 'Add a Game'
      end

      fill_in :search, with: 'Catan'
      click_on 'Search for Games'
      expect(current_path).to eq('/games/search/results')
      expect(page).to have_content('Catan')
      expect(page).to have_content('Katan')
      expect(page).to have_button('+')
      expect(page).to have_link("Don't see your game? Add it!")
    end

    it 'When I search for jibberish(has no results), I get no results' do
      # should have message to try another search or add a game call out
      visit '/dashboard'

      json_empty = File.read('spec/fixtures/empty_results.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/games/find?name=bmmf8")
        .to_return(status: 200, body: json_empty)

      within('#user-games') do
        click_on 'Add a Game'
      end

      fill_in :search, with: 'bmmf8'
      click_on 'Search for Games'
      expect(current_path).to eq('/games/search/results')
      expect(page).to have_content("We can't find anything! Try again or add it below.")
      expect(page).to have_link("Don't see your game? Add it!")
    end

    it 'When I search for a single letter or common word, I am restricted to X results' do
      # how many results should we show and how do we paginate?
      visit '/dashboard'

      json_empty = File.read('spec/fixtures/search_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/games/find?name=a")
        .to_return(status: 200, body: json_empty)

      within('#user-games') do
        click_on 'Add a Game'
      end

      fill_in :search, with: 'a'
      click_on 'Search for Games'

      expect(page).to have_css('.title', count: 20)
    end
  end
end
