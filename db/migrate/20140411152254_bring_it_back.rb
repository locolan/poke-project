class BringItBack < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.integer :pokeAPI_id

      t.timestamps
    end
  end
end
