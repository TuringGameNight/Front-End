class Game
  attr_reader :id,
              :name,
              :duration

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @duration = data[:duration]
  end
end
