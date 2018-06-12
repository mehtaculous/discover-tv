class TvShowsController < ApplicationController
  def index
    @results = Tmdb::TV.popular.results
  end

  def search
    if params[:query].present?
      @total_pages = Tmdb::Search.tv(params[:query]).total_pages
      @results = Tmdb::Search.tv(params[:query], page: 1).results
    else
      redirect_to root_path
    end
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
  end
end
