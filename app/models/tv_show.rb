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

  def self.popular
    results = []
    total_pages = 15
    1.upto(total_pages) { |page| results << Tmdb::TV.popular(page: page).results }
    return results.flatten
  end

  def self.search(query)
    results = []
    total_pages = Tmdb::Search.tv(query).total_pages
    1.upto(total_pages) do |page|
      results << Tmdb::Search.tv(query, page: page).results
      break if page == 15
    end
    return [results.flatten, results.flatten.count]
  end
end
