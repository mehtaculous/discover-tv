Rails.application.routes.draw do

  resources :tv, only: [:show]

  get 'search' => 'tv#search'

  root 'tv#index'

end
