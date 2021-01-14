class Invite
  attr_reader :id,
              :name,
              :date,
              :user_id,
              :number_of_games

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @date = data[:date]
    @user_id = data[:user_id]
    @number_of_games = data[:number_of_games]
  end
end
