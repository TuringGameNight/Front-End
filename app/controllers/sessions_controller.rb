class SessionsController < ApplicationController
  def create
    body = {
      user_data: request.env['omniauth.auth']
    }

    response = Faraday.post("#{ENV['BACKEND_URL']}/api/v1/users") do |request|
      request.body = JSON.generate(body)
    end
    user_data = JSON.parse(response.body, symbolize_names: true)
    
    session[:user] = user_data

    redirect_to dashboard_path
  end
end
