class Friend
  attr_reader :id, :name, :image, :email

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image = data[:image]
    @email = data[:email]
  end
end
