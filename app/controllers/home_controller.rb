class HomeController < ApplicationController
  caches_action :index

  def index
    redirect_to dashboard_path if current_user
  end
end
