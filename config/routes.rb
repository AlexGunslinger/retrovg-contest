Rails.application.routes.draw do

  resources 'games', only: [:index] do
    member do
      get 'scoreboard'
    end
  end

  resources 'submissions', only: [:new, :create]

  get '/submit', to: 'submissions#new'
  get '/scoreboard', to: 'home#scoreboard'
  get '/player_scoreboard/:id', to: 'home#player_scoreboard', as: 'player_scoreboard'

  root to: 'home#index'

end
