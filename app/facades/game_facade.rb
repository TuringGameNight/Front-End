class GameFacade
  def self.create_game(data, user)
    json = GameService.create_game(data, user)
  end
end
