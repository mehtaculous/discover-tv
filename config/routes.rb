Rails.application.routes.draw do

  get 'search', to: 'tv_shows#search'

  get 'tv-show', to: 'tv_shows#show'

  root to: 'tv_shows#index'

end
