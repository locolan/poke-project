PokeProject::Application.routes.draw do
  resources :users, :logins, :teams
  
  get "/search" => "searches#search"
  
  get "/get_pokemon" => "teams#get_pokemon"
  
  get "/signup" => "users#signup"
  
  root :to => "users#index"
end