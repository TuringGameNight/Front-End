class User
  attr_reader :id, :name, :image, :friends, :games

  def initialize(data)
    # @id = data[:attributes][:id]
    @name = data[:data][:attributes][:name]
    @image = data[:data][:attributes][:image]
    # @friends = []
  end

  # def add_friends(friends)
  #   friends.each do |friend|
  #     @friends << friend
  #   end
  # end
  #
  # def add_games(games)
  #   games.each do |game|
  #     @games << game
  #   end

end
