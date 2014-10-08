Rails.application.routes.draw do
  resources 'submissions', only: [:new, :create]

  get '/submit', to: 'submissions#new'

  root to: 'home#index'

end
