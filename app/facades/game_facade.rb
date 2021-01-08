class GameFacade
  def self.create_game(data)
    json = GameService.create_game(data)
    Game.new(json[:data][:attributes])
  end
end
