class Games::SearchController < ApplicationController
  def new; end

  def index
    @results = GameFacade.search(params[:search])
    flash[:error] = "We can't find anything! Try again or add it below." if @results.empty?
    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
  end
end
