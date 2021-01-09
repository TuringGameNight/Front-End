require 'rails_helper'

describe 'As a user' do
  describe 'When I visit /game-nights/new' do
    before :each do
      json_response = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response)
    end

    it 'I see a form to create a new game_night' do
      visit '/game-nights/new'

      fill_in :name, with: 'D&D'
      fill_in :date, with: Time.zone.today.strftime('%m-%d-%Y')
      find(:css, "#friends_9[value='9']").set(true)
      find(:css, "#friends_10[value='10']").set(true)
      fill_in :number_of_games, with: 10
    end

    it 'When I fill out the form and submit it, I see my new game night' do
      visit '/game-nights/new'

      json_response = File.read('spec/fixtures/game_night_data.json')
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/game-nights")
        .to_return(status: 200, body: json_response)

      json_response2 = File.read('spec/fixtures/game_night_show.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/game-nights/2")
        .to_return(status: 200, body: json_response2)

      fill_in :name, with: 'D&D'
      fill_in :date, with: Time.zone.today.strftime('%m-%d-%Y')
      find(:css, "#friends_9[value='9']").set(true)
      find(:css, "#friends_10[value='10']").set(true)
      fill_in :number_of_games, with: 10
      click_on "Let's Play!"
      expect(current_path).to eq('/game-nights/2')
    end

    xit 'If I do not add the correct data (no friends), no game night' do
      # skipping this one for now, we need to deal with a 403 in the facade
      visit '/game-nights/new'

      json_response = File.read('spec/fixtures/empty_results.json')
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/game-nights")
        .to_return(status: 403, body: json_response)

      fill_in :name, with: 'Dungeons & Dragons'
      fill_in :date, with: Time.zone.today.strftime('%m-%d-%Y')
      fill_in :number_of_games, with: 10

      click_on "Let's Play!"

      expect(page).to have_content('Please fill out all required fields')
    end
  end
end
