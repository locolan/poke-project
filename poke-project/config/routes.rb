PokeProject::Application.routes.draw do
  resources :teams, :pokemons, :users
  root :to => "teams#index"
end
