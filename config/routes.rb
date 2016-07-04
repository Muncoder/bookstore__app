Rails.application.routes.draw do

  root "authors#index"

  get '/root', to: 'authors#index'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  resources :authors
  resources :books
  resources :users

end