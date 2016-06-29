Rails.application.routes.draw do

  root "authors#index"

  resources :authors

  get "index" => "authors#index"
  get "show" => "authors#show"
  get "new" => "authors#new"



end