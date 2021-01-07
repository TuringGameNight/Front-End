class GameNightFacade
  def self.create_game_night(data)
    json = GameNightService.create_game_night(data)
    game_night = GameParty.new(json[:data])
    friends = json[:data][:relationships][:friends].map do |data|
      Friend.new(data[1])
    end
    game_night.add_friends(friends)
    game_night
  end
end
