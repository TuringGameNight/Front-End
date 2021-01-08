class GamesController < ApplicationController
  def new
    @user = UserFacade.user_info('200')
  end

  def create
    GameFacade.create_game(params)
    redirect_to dashboard_index_path
  end

end
