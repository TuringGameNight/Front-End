class Users::GamesController < ApplicationController
  before_action :is_user

  def create
    if has_game?(params[:name], session)
      flash[:error] = 'You already have that game!'
    else
      response = UserFacade.add_game(params, current_user.id)
      if response.status == 200
        flash[:success] = 'Game added to your shelf!'
        redirect_to dashboard_path
      else
        # how do we deal with errors coming from the back end? This will need to change.
        flash[:error] = 'Something went wrong. Please try again.'
        redirect_to games_search_path
      end
    end
  end

  private

  def has_game?(_game_name, session)
    unless session[:user][:data][:attributes][:games].nil?
      session[:user][:data][:attributes][:games].any? do |game|
        game[:name] == (params[:name])
      end
    end
  end
end
