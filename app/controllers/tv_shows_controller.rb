require 'will_paginate/array'

class TvShowsController < ApplicationController
  def index
    data = TvShow.popular(params[:page])
    @results = data["results"]
    @total_results = data["total_results"]
    @total_pages = Array.new(@total_results)
    @total_pages = @total_pages.paginate(:page => params[:page], :per_page => 20, :max_entries => 20000)
  end

  def search
    @results = []
    @total_pages = 0
    @total_results = 0
    if params[:query].present?
      data = TvShow.search(params[:query], params[:page])
      @results = data["results"]
      @total_results = data["total_results"]
      @total_pages = Array.new(@total_results)
      @total_pages = @total_pages.paginate(:page => params[:page], :per_page => 20, :max_entries => 20000)
    else
      redirect_to root_path
    end
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
  end
end
