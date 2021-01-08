class Games::SearchController < ApplicationController
  def new; end

  def index
    @results = GameFacade.search(params[:search])
    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
    flash[:error] = 'No movies matched your search.' if @results.empty?
  end
end
