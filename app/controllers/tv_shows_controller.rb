class TvShowsController < ApplicationController
  def index
    @results = Tmdb::TV.popular.results
  end

  def search
  end

  def show
  end
end
