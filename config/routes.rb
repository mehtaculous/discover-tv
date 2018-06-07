Rails.application.routes.draw do

  get 'tv-show', to: 'tv_shows#show'

  root to: 'tv_shows#index'

end
