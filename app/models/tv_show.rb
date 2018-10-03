class TvShow
  def self.popular
    results = []
    total_pages = 15
    1.upto(total_pages) { |page| results << Tmdb::TV.popular(page: page).results }
    return results
  end

  def self.search(query)
    results = []
    total_pages = Tmdb::Search.tv(query).total_pages
    1.upto(total_pages) do |page|
      results << Tmdb::Search.tv(query, page: page).results
      break if page == 15
    end
    total_results = results.flatten.count
    return [results, total_results]
  end
end
