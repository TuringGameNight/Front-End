class GameNightsController < ApplicationController
  before_action :is_user

  def new
    @user = current_user
  end

  def create
    game_night = GameNightFacade.create_game_night(params)
    if game_night
      flash[:success] = 'Game night created successfully!'
      redirect_to "/game-nights/#{game_night.id}"
    else
      flash.now[:error] = 'Please fill out all required fields.'
      @user = current_user
      render :new
    end
  end

  def show
    @user = current_user
    @game_night = GameNightFacade.find_game_night(params[:id])
  end
end
