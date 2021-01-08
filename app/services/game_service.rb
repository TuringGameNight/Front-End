class GameService
  def self.search(search)
    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/games/search?search=#{search}")
    results = conn.get
    JSON.parse(results.body, symbolize_names: true)
  end
end
