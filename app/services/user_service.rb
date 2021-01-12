class UserService
  def self.user_info(user_id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.add_game(game_id)
    body = { game_id: game_id,
             user_id: '' } # Once current user method exists, pass thier id with this
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/games")

    response = conn.post do |request|
      request.body = JSON.generate(body)
    end
  end
end
