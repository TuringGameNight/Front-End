class Users::GamesController < ApplicationController
  def create
    response = UserFacade.add_game(params[:id])
    if response.status == 200
      flash[:success] = 'Game added to your shelf!'
      redirect_to dashboard_index_path
    else
      # how do we deal with errors coming from the back end? This will need to change.
      redirect_to games_search_path
      flash[:error] = 'Something went wrong. Please try again.'
    end
  end
end
