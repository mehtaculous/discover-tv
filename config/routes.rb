Rails.application.routes.draw do

  get 'tv', to: 'tv_shows#show'

  root to: 'tv_shows#index'

end
