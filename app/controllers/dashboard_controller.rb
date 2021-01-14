class DashboardController < ApplicationController
  before_action :is_user

  def index
    @user = current_user
    @friends = UserFacade.get_friends(@user.id)
    @games = UserFacade.get_games(@user.id)
    @game_nights = UserFacade.get_game_nights(@user.id)
    @game_night_invites = UserFacade.get_game_night_invites(@user.id)
  end
end
