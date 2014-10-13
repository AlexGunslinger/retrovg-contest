Rails.application.routes.draw do

  resources 'games', only: [:index] do
    member do
      get 'scoreboard'
    end
  end

  resources 'submissions', only: [:new, :create]

  get '/submit', to: 'submissions#new'

  root to: 'home#index'

end
