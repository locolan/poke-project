class Team < ActiveRecord::Base
  attr_accessible :name, :pokemon_id, :user_id, :p1, :p2, :p3, :p4, :p5, :p6
  belongs_to :pokmeon
  belongs_to :user
  
  
  
  # this is for building an array for the get_pokemon path
  def get_pokemon_JSON
    r = 
    {
      :p1 => JSON.parse(self.pokeserver(self.p1)), 
      :p2 => JSON.parse(self.pokeserver(self.p2)), 
      :p3 => JSON.parse(self.pokeserver(self.p3)), 
      :p4 => JSON.parse(self.pokeserver(self.p4)), 
      :p5 => JSON.parse(self.pokeserver(self.p5)), 
      :p6 => JSON.parse(self.pokeserver(self.p6))  
    }
    
    JSON.generate(r)
  end
  
  def pokeserver(p)
    pokemon_path = Pokemon.where("name LIKE ?", "%#{p.downcase}%")[0].resource_uri
    
    return Pokegem.get("pokemon",pokemon_path[15,pokemon_path.length-16].to_i)
  end
end
