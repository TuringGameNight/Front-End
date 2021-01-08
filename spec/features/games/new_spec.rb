require 'rails_helper'

describe 'As a user' do
  describe 'when search for a game and cannot find it' do
    it 'I can add a new game to the app' do
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/games").
         with(
           body: {
             "description"=>"Use resources to build a village of critters and constructions in this woodland game.",
             "duration"=>"80",
             "game_type"=>"Board game",
             "image"=>"https://boardgamegeek.com/image/3918905/everdell",
             "min_age"=>"13",
             "name"=>"Everdell"
           },
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/x-www-form-urlencoded',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: "", headers: {})

      visit new_game_path

      fill_in :name, with: 'Everdell'
      fill_in :game_type, with: 'Board game'
      fill_in :description, with: 'Use resources to build a village of critters and constructions in this woodland game.'
      fill_in :min_age, with: 13
      fill_in :duration, with: 80
      fill_in :image, with: 'https://boardgamegeek.com/image/3918905/everdell'

      click_on "Add Game"

      expect(page).to have_content("Game created successfully and added to your shelf!")
      expect(current_path).to eq(dashboard_index_path)
    end
  end
end
