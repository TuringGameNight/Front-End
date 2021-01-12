class GameNightFacade
  def self.create_game_night(data)
    json = GameNightService.create_game_night(data)
    unless json[:data].empty?
      game_night = GameParty.new(json[:data][:attributes])
      friends = json[:data][:relationships][:friends][:data].map do |data|
        Friend.new(data)
      end
      game_night.add_friends(friends)
      game_night
    end
  end

  def self.find_game_night(id)
    json = GameNightService.find_game_night(id)
    game_night = GameParty.new(json[:data][:attributes])
    friends = json[:data][:relationships][:friends].map do |data|
      Friend.new(data[1])
    end
    games = json[:data][:relationships][:games].map do |data|
      Game.new(data[1])
    end
    game_night.add_friends(friends)
    game_night.add_games(games)
    game_night
  end
end
