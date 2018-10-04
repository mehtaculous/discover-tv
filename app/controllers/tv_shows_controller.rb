require 'will_paginate/array'

class TvShowsController < ApplicationController
  def index
    @results = TvShow.popular.paginate(:page => params[:page], :per_page => 30)
  end

  def search
    @results = []
    @total_results = 0
    if params[:query].present?
      @results, @total_results = TvShow.search(params[:query])
      @results.each do |show|
        tv_show = TvShow.find_or_initialize_by(tv_id: show["id"])
        tv_show.name = show["name"]
        tv_show.first_air = show["first_air_date"]
        tv_show.rating = show["vote_average"]
        tv_show.overview = show["overview"]
        tv_show.poster_path = show["poster_path"]
        tv_show.backdrop_path = show["backdrop_path"]
        tv_show.save
      end
      @results = @results.paginate(:page => params[:page], :per_page => 30)
    else
      redirect_to root_path
    end
  end

  def show
    @result = Tmdb::TV.detail(params[:id])
    tv_show = TvShow.find_or_initialize_by(tv_id: @result["id"])
    tv_show.genres = []
    tv_show.creators = []
    tv_show.networks = []
    @result.genres.each { |genre| tv_show.genres << genre["name"] }
    @result.created_by.each { |creator| tv_show.creators << creator["name"] }
    @result.networks.each { |network| tv_show.networks << network["name"] }
    tv_show.homepage = @result["homepage"]
    tv_show.seasons = @result["number_of_seasons"]
    tv_show.episodes = @result["number_of_episodes"]
    tv_show.run_times = @result["episode_run_time"]
    tv_show.save
  end
end
