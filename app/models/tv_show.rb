class TvShow < ApplicationRecord
  # name: string
  # first_air: date
  # rating: float
  # genres: string, []
  # overview: text
  # poster_path: string
  # backdrop_path: string
  # homepage: string
  # creators: string, []
  # seasons: integer
  # episodes: integer
  # run_times: string, []
  # networks: string, []
  # tv_id: integer
  # created_at: datetime
  # updated_at: datetime

  serialize :genres
  serialize :creators
  serialize :run_times
  serialize :networks

  def self.popular(page)
    Rails.cache.fetch("popular/#{page}", expires_in: 30.minutes) do
      Tmdb::TV.popular(page: page) if page.to_i <= 1000
    end
  end

  def self.search(query, page)
    Rails.cache.fetch("search/#{query}/#{page}", expires_in: 30.minutes) do
      Tmdb::Search.tv(query, page: page) if page.to_i <= 1000
    end
  end
end
