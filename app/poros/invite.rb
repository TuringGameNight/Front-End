class Invite
  attr_reader :id,
              :host_name,
              :name,
              :date,
              :user_id,
              :number_of_games,
              :host_name

  def initialize(data)
    @id = data[:id]
    @host_name = data[:host_name]
    @name = data[:name]
    @date = data[:date]
    @user_id = data[:user_id]
    @number_of_games = data[:number_of_games]
  end
end
