Rails.application.routes.draw do

  resources 'games', only: [:index] do
    member do
      get 'scoreboard'
    end
  end

  resources 'users', except: :index
  resources 'submissions', except: :index

  get '/submit', to: 'submissions#new'
  get '/scoreboard', to: 'home#scoreboard'
  get '/player_scoreboard/:id', to: 'home#player_scoreboard', as: 'player_scoreboard'
  get '/submissionsonlywolf', to: 'submissions#index'
  get '/playersonlywolf', to: 'users#index'
  
  root to: 'home#index'

end
