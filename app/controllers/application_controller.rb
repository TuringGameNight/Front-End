class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_user

  def is_user
    redirect_to root_path if current_user.nil?
  end

  def current_user
    @current_user ||= create_user(session[:user])
  end

  private

  def create_user(data)
    unless data.nil?
      user = User.new(data)
      friends = data[:data][:attributes][:buds].map do |friend|
        Friend.new(friend)
      end
      games = data[:data][:attributes][:games].map do |game|
        Game.new(game)
      end
      game_nights = data[:data][:attributes][:game_nights].map do |game_night|
        GameParty.new(game_night)
      end
      user.add_friends(friends)
      user.add_games(games)
      user.add_game_nights(game_nights)
      user
    end
  end
end
