require 'rails_helper'

describe 'As a user' do
  describe 'When I visit my dashboard' do
    before :each do
      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
    end
    it 'I see a button to add a game' do
      visit '/dashboard'

      within('#user-games') do
        expect(page).to have_button('Add a Game')
      end
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
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/games/search?search=Catan")
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
  end
end
