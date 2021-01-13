class GameNightFacade
  def self.create_game_night(data, user_id)
    GameNightService.create_game_night(data, user_id)
  end

  def self.find_game_night(id)
    json = GameNightService.find_game_night(id)
    game_night = GameParty.new(json[:data])
  end
end
