class GameFacade
  def self.search(search)
    json = GameService.search(search)
    json[:data].map do |data|
      Game.new(data[:attributes])
    end
  end
end
