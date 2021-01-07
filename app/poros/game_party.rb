class GameParty
  attr_reader :id, :name, :date, :user_id, :number_of_games, :friends, :games

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @date = data[:attributes][:date]
    @user_id = data[:attributes][:user_id]
    @number_of_games = data[:attributes][:number_of_games]
    @friends = []
    @games = []
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
