class GameNightService
  def self.create_game_night(data, user_id)
    body = { name: data[:name],
             date: data[:date],
             number_of_games: data[:number_of_games],
             friends: data[:friends],
             user_id: user_id }

    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/game_nights")

    response = conn.post do |request|
      request.body = JSON.generate(body)
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_game_night(id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/game_nights/#{id}")
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end
end
