class DropThatTable < ActiveRecord::Migration
  def change
    drop_table :pokemons
  end
end
