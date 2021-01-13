class User
  attr_reader :id, :name, :image, :friends, :games, :game_nights

  def initialize(user_info)
    @id = user_info[:data][:attributes][:id]
    @name = user_info[:data][:attributes][:name]
    @image = user_info[:data][:attributes][:image]
  end
end
