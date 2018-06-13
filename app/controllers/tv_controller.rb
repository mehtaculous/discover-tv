class TvController < ApplicationController
  def index
    @results = []
    @total_pages = 10
    @total_pages.times do |i|
      @results << Tmdb::TV.popular(page: i + 1).results
    end
  end

  def search
    @results = []
    @total_pages = 0
    if params[:query].present?
      @total_pages = Tmdb::Search.tv(params[:query]).total_pages
      @total_pages.times do |page|
        page += 1
        @results << Tmdb::Search.tv(params[:query], page: page).results
        @total_pages = page
        break if @total_pages == 10
      end
    else
      redirect_to root_path
    end
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
  end
end
