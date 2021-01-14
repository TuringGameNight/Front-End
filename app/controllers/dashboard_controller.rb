class DashboardController < ApplicationController
  before_action :is_user

  def index
    @user = current_user
    @friends = UserFacade.get_friends(@user.id)
    @pending_friends = UserFacade.get_friend_requests(@user.id)
    @games = UserFacade.get_games(@user.id)
    @game_nights = UserFacade.get_game_nights(@user.id)
  end
end
