class UserFacade
  def self.user_info(user_id)
    json = UserService.user_info(user_id)
    friends = json[:data][:relationships][:friends][:data].map do |data|
      Friend.new(data)
    end
    games = json[:data][:relationships][:games][:data].map do |data|
      Game.new(data)
    end
    game_nights = json[:data][:relationships][:game_nights][:data].map do |data|
      GameParty.new(data)
    end
    user = User.new(json[:data])
    user.add_friends(friends)
    user.add_games(games)
    user.add_game_nights(game_nights)
    user
  end

  def self.add_game(game_id)
    UserService.add_game(game_id)
  end
end
