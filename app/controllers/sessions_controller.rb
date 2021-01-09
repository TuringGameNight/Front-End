class SessionsController < ApplicationController
  def create
    body = {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      user_data: request.env['omniauth.auth']
    }

    response = Faraday.post("#{ENV['BACKEND_URL']}/api/v1/users") do |request|
      request.body = JSON.generate(body)
    end
    binding.pry
    user_data = JSON.parse(response.body, symbolize_names: true)
    user = User.new(user_data)

    # session[:user] = user
    #
    # redirect_to dashboard_index_path
  end
end
