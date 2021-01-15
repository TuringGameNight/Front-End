class Invite
  attr_reader :id,
              :host_name,
              :name,
              :date,
              :host_id,
              :number_of_games,
              :host_name

  def initialize(data)
    @id = data[:id].to_i
    @host_name = data[:attributes][:game_night][:host_name]
    @name = data[:attributes][:game_night][:name]
    @date = data[:attributes][:game_night][:date]
    @host_id = data[:attributes][:game_night][:host_id]
    @number_of_games = data[:attributes][:game_night][:number_of_games]
  end
end
