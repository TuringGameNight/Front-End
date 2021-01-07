class UserService
  def self.user_info(user_id)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/users/#{user_id}")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end
end
