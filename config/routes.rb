Rails.application.routes.draw do

  resources :tv_shows, only: [:show]

  get 'search' => 'tv_shows#search'

  root 'tv_shows#index'

end
