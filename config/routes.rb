Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get :dashboard, to: 'dashboard#index'

  get "/game-nights/new", to: "game_nights#new"
  post "/game-nights", to: "game_nights#create"
  get "/game-nights/:id", to: "game_nights#show"

  resources :games, only: [:new, :create]
  namespace :games do
    get '/search', to: "search#new"
    get '/search/results', to: "search#index"
  end

  namespace :users do
    post '/games', to: 'games#create'
  end

end
