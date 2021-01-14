class Friend
  attr_reader :id, :name, :image, :email
<<<<<<< HEAD
=======

>>>>>>> 7180468584f868e020f2bc465f46c589311b8ac5
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image = data[:image]
    @email = data[:email]
  end
end
