class TeamsController < ApplicationController
  def new
    pokemon_arr = params[:pokemon]
    pokemon = Pokemon.all
    
    @team = Team.new
    
    @team.p1 = pokemon_arr[0]
    @team.p2 = pokemon_arr[1]
    @team.p3 = pokemon_arr[2]
    @team.p4 = pokemon_arr[3]
    @team.p5 = pokemon_arr[4]
    @team.p6 = pokemon_arr[5]
    
    @team.user_id = current_user.id
    @team.save
    
    r = {:id => @team.id,
      :p1 => @team.p1,
      :p2 => @team.p2,
      :p3 => @team.p3,
      :p4 => @team.p4,
      :p5 => @team.p5,
      :p6 => @team.p6
    }
    
    result = JSON.generate(r)
    
    respond_to do |format|
      format.json { render json: result, :status => :ok}
    end
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def edit
    @team = Team.find(params[:id])
    @team.name = params[:name]
    @team.save
  end
  
  def get_pokemon
    @team = Team.find(params[:team_id]) 
    r = 
    {
      :p1 => JSON.parse(pokeserver(@team.p1)), 
      :p2 => JSON.parse(pokeserver(@team.p2)), 
      :p3 => JSON.parse(pokeserver(@team.p3)), 
      :p4 => JSON.parse(pokeserver(@team.p4)), 
      :p5 => JSON.parse(pokeserver(@team.p5)), 
      :p6 => JSON.parse(pokeserver(@team.p6))  
    }
    
    result = JSON.generate(r)
    
    respond_to do |format|
      format.json { render json: result, :status => :ok }
    end
  end
  
  def pokeserver(p)
    pokemon_path = Pokemon.where("name LIKE ?", "%#{p.downcase}%")[0].resource_uri
    
    return result = Pokegem.get("pokemon",pokemon_path[15,pokemon_path.length-16].to_i)
  end
  
end
