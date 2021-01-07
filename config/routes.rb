Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get "/game-nights/new", to: "game_nights#new"
  post "/game-nights", to: "game_nights#create"
  get "/game-nights/:id", to: "game_nights#show"
end
