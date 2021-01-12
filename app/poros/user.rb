class User
  attr_reader :id, :name, :image, :friends, :games, :game_nights

  def initialize(user_info)
    @id = user_info[:data][:attributes][:id]
    @name = user_info[:data][:attributes][:name]
    @image = user_info[:data][:attributes][:image]
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
end
