class Friend
  attr_reader :id, :name, :image

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @image = data[:attributes][:image]
  end
end
