require 'rails_helper'

RSpec.feature "TvShows" do
  let(:show) { Tmdb::TV.detail(63247) }

  describe "popular shows" do
    it "displays list of popular tv shows" do
      visit root_path
      expect(page).to have_css('#popular')
      expect(page).to have_css('.card')
    end
  end

  describe "search results" do
    it "displays results matching query" do
      visit root_path
      within("#search") do
        fill_in('query', :with => 'West')
      end
      find(:css, '#search-button').click
      expect(page).to have_content('Search Results (151)')
      expect(page).to have_css('.card')
    end

    it "displays no results to match query" do
      visit root_path
      within("#search") do
        fill_in('query', :with => 'asdf')
      end
      find(:css, '#search-button').click
      expect(page).to have_content('Search Results (0)')
      expect(page).not_to have_css('.card')
    end

    it "redirects user to home page with empty query" do
      visit root_path
      within("#search") do
        fill_in('query', :with => '')
      end
      find(:css, '#search-button').click
      expect(current_path).to have_content('/')
    end
  end

  describe "tv show page" do
    it "displays details of tv show" do
      visit tv_show_path(show.id)
      expect(page).to have_content(show.name)
      expect(page).to have_content(show.overview)
    end
  end
end
