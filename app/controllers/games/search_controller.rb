class Games::SearchController < ApplicationController
  before_action :is_user

  caches_action :new

  def new; end

  def index
    @results = GameFacade.search(params[:search])
    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
  end
end
