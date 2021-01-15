class Game
  attr_reader :name,
              :description,
              :duration,
              :image,
              :game_type,
              :age_range,
              :num_players,
              :id

  def initialize(data, id=nil)
    @name = data[:name]
    @duration = data[:duration]
    @description = data[:description]
    @age_range = data[:age_range]
    @game_type = data[:game_type]
    @image = data[:image]
    @num_players = data[:num_players]
    @id = id
  end
end
