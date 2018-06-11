Rails.application.routes.draw do

  resources :tv_shows, only: [:show]

  root 'tv_shows#index'

end
