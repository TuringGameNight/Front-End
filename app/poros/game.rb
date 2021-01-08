class Game
  attr_reader :id,
              :name,
              :playtime

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @playtime = data[:playtime]
  end
end
