class UserFacade
  def self.user_info(user_id)
    json = UserService.user_info(user_id)
    friends = json[:data][:relationships][:friends].map do |data|
      Friend.new(data[1])
    end
    user = User.new(json[:data])
    user.add_friends(friends)
    user
  end
end
