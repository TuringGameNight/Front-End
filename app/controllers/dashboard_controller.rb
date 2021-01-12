class DashboardController < ApplicationController
  before_action :is_user

  def index
    @user = current_user
  end
end
