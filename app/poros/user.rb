class User
  attr_reader :id, :name, :image, :friends, :games, :game_nights

  def initialize(data)
<<<<<<< HEAD
    @id = data[:attributes][:id]
    @name = data[:attributes][:name]
    @image = data[:attributes][:image]
    @friends = []
    @games = []
    @game_nights = []
  end

  def add_friends(friends)
    friends.each do |friend|
      @friends << friend
    end
  end

  def add_games(games)
    games.each do |game|
      @games << game
    end
  end

  def add_game_nights(game_nights)
    game_nights.each do |game_night|
      @game_nights << game_night
    end
  end
=======
    @id = data[:data][:attributes][:id]
    @name = data[:data][:attributes][:name]
    @image = data[:data][:attributes][:image]
  end

>>>>>>> d3b1f114f438bdb0f23768878b8ff8708ca18d1d
end
