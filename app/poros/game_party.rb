class GameParty
  attr_reader :id, :name, :date, :user_id, :number_of_games, :friends
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @date = data[:attributes][:date]
    @user_id = data[:attributes][:user_id]
    @number_of_games = data[:attributes][:number_of_games]
    @friends = []
  end

  def add_friends(friends)
    friends.each do |friend|
      @friends << friend
    end
  end
end
