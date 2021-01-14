class Users::InvitationsController < ApplicationController
  def update
    UserFacade.accept_game_night_invite(params[:invite_id])
    redirect_to dashboard_path
  end

  def destroy
    UserFacade.decline_game_night_invite(params[:invite_id])
    redirect_to dashboard_path
  end
end
