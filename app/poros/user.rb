class User
  attr_reader :id, :name, :image, :friends, :games, :game_nights

  def initialize(data)
    @id = data[:data][:attributes][:id]
    @name = data[:data][:attributes][:name]
    @image = data[:data][:attributes][:image]
  end

end
