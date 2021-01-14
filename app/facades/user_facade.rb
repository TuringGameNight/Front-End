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

  def self.add_game(params, user_id)
    UserService.add_game(params, user_id)
  end

  def self.get_friends(user_id)
    json = UserService.get_friends(user_id)
    json[:data].map do |data|
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

  def self.get_game_night_invites(user_id)
    json = UserService.get_game_night_invites(user_id)
    invites = json[:data][:relationships][:invitations]
    invites[:data].map do |data|
      Invite.new(data)
    end
  end

end
