class UserService
  def self.user_info(user_id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.add_game(params, user_id)
    body = { name: params[:name],
             description: params[:description],
             duration: params[:duration],
             image: params[:image],
             game_type: params[:game_type],
             age_range: params[:age_range],
             num_players: params[:num_players],
             user_id: user_id } # Once current user method exists, pass thier id with thi]s
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/games")

    response = conn.post do |request|
      request.body = JSON.generate(body)
    end
  end

  def self.get_friends(user_id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/friends")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.get_games(user_id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/games")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.get_game_nights(user_id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/game_nights")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.add_friend(friend_email, user_id)
    body = {
      user_id: user_id,
      friend_email: friend_email
    }

    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/friends")
    response = conn.post do |request|
      request.body = JSON.generate(body)
    end
  end

  def self.accept_friend_request(user_id, friend_id)
    body = {
      user_id: user_id,
      friend_id: friend_id,
      status: 'accepted'
    }
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/friends/#{friend_id}")
    response = conn.patch do |request|
      request.body = JSON.generate(body)
    end
  end

  def self.decline_friend_request(user_id, friend_id)
    body = {
      user_id: user_id,
      friend_id: friend_id
    }
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}/friends/#{friend_id}")
    response = conn.delete do |request|
      request.body = JSON.generate(body)
    end
  end
end
