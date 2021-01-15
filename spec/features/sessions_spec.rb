require 'rails_helper'

describe 'Session spec', type: :feature do
  describe 'As a user' do
    before :each do
      json_response1 = File.read('spec/fixtures/fake_google_user_data.json')
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/users")
        .to_return(status: 200, body: json_response1)

      friends_response = File.read('spec/fixtures/new_friends_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/friends")
        .to_return(status: 200, body: friends_response)

      games_response = File.read('spec/fixtures/new_user_games.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/games")
        .to_return(status: 200, body: games_response)

      game_nights_response = File.read('spec/fixtures/new_users_game_nights.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/game_nights")
        .to_return(status: 200, body: game_nights_response)

      game_nights_invites = File.read('spec/fixtures/invites.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200/invitations")
        .to_return(status: 200, body: game_nights_invites)  

      json = JSON.parse(json_response1, symbolize_names: true)
      @user = User.new(json)
    end

    it 'I can log in' do
      stub_omniauth
      visit root_path

      click_link 'Login with Google'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Welcome Jake!')
    end

    it 'I can logout' do
      stub_omniauth
      visit root_path

      click_link 'Login with Google'

      visit logout_path
      expect(current_path).to eq(root_path)
    end
  end
end
