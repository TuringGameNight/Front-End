class DashboardController < ApplicationController
  def index
    # Below will eventually need to be replaced by current_user
    @user = UserFacade.user_info('200')
  end
end
