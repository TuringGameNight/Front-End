class Users::FriendsController < ApplicationController
  before_action :is_user

  def create
    response = UserFacade.add_friend(params[:friend_email], current_user.id)
    if response.status == 200
      flash[:success] = 'Friend request sent!'
      redirect_to dashboard_path
    else
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to dashboard_path
    end
  end
end
