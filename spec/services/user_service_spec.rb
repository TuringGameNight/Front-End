require 'rails_helper'

RSpec.describe UserService do
  context '#user_info' do
    it 'returns appropriate data' do
      json_response = File.read('spec/fixtures/user_data.json')
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/users/200")
        .to_return(status: 200, body: json_response)

      results = UserService.user_info('200')
      expect(results).to be_a(Hash)

      user_response_checker(results)

      expect(results[:data][:id]).to eq('200')

      expect(results[:data][:attributes][:id]).to eq('200')

      expect(results[:data][:attributes][:name]).to eq('Jake')

      expect(results[:data][:attributes][:image]).to eq('image_url')

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
