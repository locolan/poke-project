require "spec_helper"

describe PokemonsController do
  describe "routing" do

    it "routes to #index" do
      get("/pokemons").should route_to("pokemons#index")
    end

    it "routes to #new" do
      get("/pokemons/new").should route_to("pokemons#new")
    end

    it "routes to #show" do
      get("/pokemons/1").should route_to("pokemons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pokemons/1/edit").should route_to("pokemons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pokemons").should route_to("pokemons#create")
    end

    it "routes to #update" do
      put("/pokemons/1").should route_to("pokemons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pokemons/1").should route_to("pokemons#destroy", :id => "1")
    end

  end
end
