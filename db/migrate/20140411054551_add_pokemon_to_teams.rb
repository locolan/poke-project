class AddPokemonToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :p1, :string
    add_column :teams, :p2, :string
    add_column :teams, :p3, :string
    add_column :teams, :p4, :string
    add_column :teams, :p5, :string
    add_column :teams, :p6, :string
  end
end
