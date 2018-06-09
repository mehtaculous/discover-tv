Rails.application.routes.draw do

  get 'tv', to: 'tv_shows#show'

  root 'tv_shows#index'

end
