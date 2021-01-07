class GameParty
  attr_reader :id, :name, :date, :user_id, :number_of_games, :friends, :games

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @date = data[:date]
    @user_id = data[:user_id]
    @number_of_games = data[:number_of_games]
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
