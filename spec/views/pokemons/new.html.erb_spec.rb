require 'spec_helper'

describe "pokemons/new" do
  before(:each) do
    assign(:pokemon, stub_model(Pokemon).as_new_record)
  end

  it "renders new pokemon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pokemons_path, "post" do
    end
  end
end
