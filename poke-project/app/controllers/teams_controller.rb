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
  end
  
  def get_pokemon
    @team = Team.find(params[:team_id])
    
  end
  
end
