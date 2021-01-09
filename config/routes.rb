Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

<<<<<<< HEAD
  resources :dashboard, only: [:index]
=======
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
>>>>>>> d3b1f114f438bdb0f23768878b8ff8708ca18d1d

  get "/game-nights/new", to: "game_nights#new"
  post "/game-nights", to: "game_nights#create"
  get "/game-nights/:id", to: "game_nights#show"
<<<<<<< HEAD

  resources :games, only: [:new, :create]
  namespace :games do
    get '/search', to: "search#new"
    get '/search/results', to: "search#index"
  end
  
  namespace :users do
    post '/games/:id', to: 'games#create'
  end

=======
>>>>>>> d3b1f114f438bdb0f23768878b8ff8708ca18d1d
end
