require 'will_paginate/array'

class TvShowsController < ApplicationController
  def index
    if params[:page].to_i <= 1000
      data = TvShow.popular(params[:page])
      get_results(data)
    else
      redirect_to request.referrer
    end
  end

  def search
    if params[:query].present? && params[:page].to_i <= 1000
      data = TvShow.search(params[:query], params[:page])
      get_results(data)
    else
      redirect_to request.referrer
    end
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
  end

  private

  def get_results(data)
    @results = data["results"]
    @total_results = data["total_results"]
    @total_pages = Array.new(@total_results)
    @total_pages = @total_pages.paginate(:page => params[:page], :per_page => 20)
  end
end
