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
end
