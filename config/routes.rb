Rails.application.routes.draw do

  root 'tv_shows#index'
  get 'search' => 'tv_shows#search'

  resources :tv_shows, only: [:show], :path => 'tv'

  devise_for :users, :controllers => { registrations: 'registrations' }

  as :user do
    get 'users', :to => 'devise/registrations#edit', :as => :user_root
  end

end
