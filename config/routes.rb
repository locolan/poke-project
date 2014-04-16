PokeProject::Application.routes.draw do
  resources :pokemons


  resources :users


  resources :teams


  resources :users, :logins, :teams
  
  get "/users" => "users#index"
  
  get "/search" => "searches#search"
  
  get "/get_pokemon/" => "teams#get_pokemon"
  
  get "/signup" => "users#signup"
  
  root :to => "users#index"
end