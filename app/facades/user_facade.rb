class UserFacade
  def self.add_game(params, user_id)
    UserService.add_game(params, user_id)
  end

  def self.get_friends(user_id)
    json = UserService.get_friends(user_id)
    json[:data][:attributes][:accepted_friends].map do |data|
      Friend.new(data)
    end
  end

  def self.get_friend_requests(user_id)
    json = UserService.get_friends(user_id)
    json[:data][:attributes][:pending_friends].map do |friend_request|
      Friend.new(friend_request)
    end
  end

  def self.get_games(user_id)
    json = UserService.get_games(user_id)
    json[:data].map do |data|
      Game.new(data[:attributes], data[:id])
    end
  end

  def self.get_game_nights(user_id)
    json = UserService.get_game_nights(user_id)
    json[:data].map do |data|
      GameParty.new(data)
    end
  end

  def self.add_friend(friend_email, user_id)
    UserService.add_friend(friend_email, user_id)
  end

  def self.accept_friend_request(user_id, friend_id)
    json = UserService.accept_friend_request(user_id, friend_id)
  end
end
