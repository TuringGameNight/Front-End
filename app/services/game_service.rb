class GameService
  def self.search(search)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/games/search?search=#{search}")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end
  
  def self.create_game(data, _user)
    body = { name: data[:name],
             game_type: data[:game_type],
             description: data[:description],
             min_age: data[:min_age],
             duration: data[:duration],
             image: data[:image] }

    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/games")

    response = conn.post do |request|
      request.body = body
    end
  end
end
