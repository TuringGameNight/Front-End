class User
  attr_reader :id, :name, :image, :friends, :games
  def initialize(data)
    @id = data[:attributes]
    @name = data[:attributes]
    @image = data[:attributes]
    @friends = []
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
end
