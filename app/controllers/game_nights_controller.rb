class GameNightsController < ApplicationController
  before_action :is_user

  def new
    @user = current_user
    @friends = UserFacade.get_friends(@user.id)
  end

  def create
    game_night = GameNightFacade.create_game_night(params, current_user.id)
    if game_night[:message] == 'success'
      flash[:success] = 'Game night created successfully!'
      redirect_to "/dashboard"
    else
      flash.now[:error] = 'Please fill out all required fields.'
      @user = current_user
      @friends = UserFacade.get_friends(@user.id)
      render :new
    end
  end

  def show
    @user = current_user
    @game_night = GameNightFacade.find_game_night(params[:id])
    @friends = UserFacade.get_friends(@user.id)
    @games = UserFacade.get_games(@user.id)
  end
end
