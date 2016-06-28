Rails.application.routes.draw do

  get "index" => "authors#index"
  get "show" => "authors#show"

end