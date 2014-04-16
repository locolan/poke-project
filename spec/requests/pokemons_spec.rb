require 'spec_helper'

describe "Pokemons" do
  describe "GET /pokemons" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pokemons_path
      response.status.should be(200)
    end
  end
end
