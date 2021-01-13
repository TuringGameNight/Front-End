class GameParty
  attr_reader :id, :name, :date, :number_of_games

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @date = data[:attributes][:date]
    @number_of_games = data[:attributes][:number_of_games]
  end
end
