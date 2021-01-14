require 'rails_helper'

RSpec.describe UserService do
  context '#create_game_night' do
    it 'returns appropriate data' do
      json_response = File.read('spec/fixtures/game_night_data.json')
      stub_request(:post, "#{ENV['BACKEND_URL']}/api/v1/game_nights")
        .to_return(status: 200, body: json_response)

      json_response1 = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response1)
      json = JSON.parse(json_response1, symbolize_names: true)
      user = User.new(json)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      game_night_data = { name: 'D&D',
                          date: '01-06-2021',
                          number_of_games: '10',
                          friends: %w[9 10] }

      results = GameNightService.create_game_night(game_night_data, user.id)

      game_night_response_checker(results)

      expect(results[:data][:attributes][:id]).to eq('2')

      expect(results[:data][:attributes][:name]).to eq('D&D')

      expect(results[:data][:attributes][:date]).to eq('01-06-2021')

      expect(results[:data][:attributes][:user_id]).to eq('200')

      expect(results[:data][:attributes][:number_of_games]).to eq('10')

      expect(results[:data][:relationships][:friends][:data][0]).to be_a(Hash)

      expect(results[:data][:relationships][:friends][:data][0][:id]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][0][:id]).to eq('9')

      expect(results[:data][:relationships][:friends][:data][0][:type]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][0][:type]).to eq('user')

      expect(results[:data][:relationships][:friends][:data][0][:name]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][0][:name]).to eq('Sean')

      expect(results[:data][:relationships][:friends][:data][0][:image]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][0][:image]).to eq('image_url')

      expect(results[:data][:relationships][:friends][:data][1]).to be_a(Hash)

      expect(results[:data][:relationships][:friends][:data][1][:id]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][1][:id]).to eq('10')

      expect(results[:data][:relationships][:friends][:data][1][:type]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][1][:type]).to eq('user')

      expect(results[:data][:relationships][:friends][:data][1][:name]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][1][:name]).to eq('Robert')

      expect(results[:data][:relationships][:friends][:data][1][:image]).to be_a(String)
      expect(results[:data][:relationships][:friends][:data][1][:image]).to eq('image_url')
    end
  end
end
