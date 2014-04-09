PokeProject::Application.routes.draw do
  resources :users, :logins
  
  get "/search" => "searches#search"
  
  root :to => "users#index"
end