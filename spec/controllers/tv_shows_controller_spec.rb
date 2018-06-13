require 'rails_helper'

RSpec.describe TvShowsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end

    it "renders index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: 63247}
      expect(response).to be_successful
    end

    it "renders show view" do
      get :show, {id: 63247}
      expect(response).to render_template :show
    end
  end

end
