require 'will_paginate/array'

class TvShowsController < ApplicationController
  def index
    @results = TvShow.popular.flatten.paginate(:page => params[:page], :per_page => 30)
  end

  def search
    @results = []
    @total_results = 0
    if params[:query].present?
      @results, @total_results = TvShow.search(params[:query])
      @results = @results.flatten.paginate(:page => params[:page], :per_page => 30)
    else
      redirect_to root_path
    end
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
  end
end
