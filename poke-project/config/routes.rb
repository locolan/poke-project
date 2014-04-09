PokeProject::Application.routes.draw do
  get "searches/search"

  resources :users
  
  get "/search" => "searches#search"
  
  root :to => "users#index"
end