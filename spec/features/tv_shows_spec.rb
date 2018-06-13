require 'rails_helper'

RSpec.feature "TvShows", type: :feature do
  describe "popular shows" do
    it "displays list of popular tv shows" do
      visit root_path
      expect(page).to have_content 'Popular TV Shows'
    end
  end

  describe "search results" do
    it "display results matching query" do
      visit root_path
      within("#search") do
        fill_in 'query', with: 'West'
      end
      find(:css, 'i.fa.fa-search').click
      expect(page).to have_content 'Search Results'
    end
  end

  describe "tv show page" do
    it "displays details of tv show" do
      visit tv_show_path(63247)
      expect(page).to have_content 'Westworld'
    end
  end
end
