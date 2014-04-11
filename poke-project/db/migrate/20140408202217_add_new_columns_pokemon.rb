class AddNewColumnsPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :resource_uri, :string
  end
end
