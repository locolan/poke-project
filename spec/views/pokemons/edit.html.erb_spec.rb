require 'spec_helper'

describe "pokemons/edit" do
  before(:each) do
    @pokemon = assign(:pokemon, stub_model(Pokemon))
  end

  it "renders the edit pokemon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pokemon_path(@pokemon), "post" do
    end
  end
end
