class UserFacade
  def self.user_info(user_id)
    json = UserService.user_info(user_id)
    friends = json[:data][:relationships][:friends][:data].map do |data|
      Friend.new(data)
    end
    user = User.new(json[:data])
    user.add_friends(friends)
    user
  end
end
