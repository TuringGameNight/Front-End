class GameFacade
  def self.search(search)
    json = GameService.search(search)
    json[:data].map do |data|
      Game.new(data[:attributes])
    end
  end

  def self.create_game(data, user)
    json = GameService.create_game(data, user)
  end
end
