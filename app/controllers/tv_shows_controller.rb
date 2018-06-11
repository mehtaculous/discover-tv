class TvShowsController < ApplicationController
  def index
    @results = Tmdb::TV.popular.results
  end

  def search
    # @results = Tmdb::Search.tv(params[:query])
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
  end
end
