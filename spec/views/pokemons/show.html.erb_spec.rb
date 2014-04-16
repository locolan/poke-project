require 'spec_helper'

describe "pokemons/show" do
  before(:each) do
    @pokemon = assign(:pokemon, stub_model(Pokemon))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
