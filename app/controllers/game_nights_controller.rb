class GameNightsController < ApplicationController
  def new
    @user = UserFacade.user_info('200')
  end

  def create
    game_night = GameNightFacade.create_game_night(params)
    redirect_to "/game-nights/#{game_night.id}"
  end

  def show; end
end
