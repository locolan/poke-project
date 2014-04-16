require 'spec_helper'

describe "pokemons/index" do
  before(:each) do
    assign(:pokemons, [
      stub_model(Pokemon),
      stub_model(Pokemon)
    ])
  end

  it "renders a list of pokemons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
