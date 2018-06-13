require 'rails_helper'

RSpec.feature "TvShows" do
  let(:popular) { Tmdb::TV.popular.results }
  let(:search) { Tmdb::Search.tv('West').results }
  let(:show) { Tmdb::TV.detail(63247) }

  describe "popular shows" do
    it "displays list of popular tv shows" do
      visit root_path
      expect(page).to have_css('#popular')
    end
  end

  describe "search results" do
    it "display results matching query" do
      visit root_path
      within("#search") do
        fill_in('query', :with => 'West')
      end
      find(:css, 'i.fa.fa-search').click
      expect(page).to have_css('#search')
    end
  end

  describe "tv show page" do
    it "displays details of tv show" do
      visit tv_show_path(show.id)
      expect(page).to have_content(show.name)
    end
  end
end
