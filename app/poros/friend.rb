class Friend
  attr_reader :id, :name

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image = data[:image]
  end
end
