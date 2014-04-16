class SearchesController < ApplicationController
  def search
    # if params send a name, pokemon_path = resource_uri of the given pokemon name
    # else a resource params was sent, pokemon_path = the resource params
    if(params[:name])
      pokemon_path = Pokemon.where("name LIKE ?", "%#{params[:name]}%")[0].resource_uri
    else
      pokemon_path = params[:uri]
    end
    
    
    # this makes a json request to pokeAPI server, gets a JSON object back in result
    result = Pokegem.get(params[:resource],pokemon_path[15,pokemon_path.length-16].to_i)

    respond_to do |format|
      format.json { render json: result, :status => :ok}
    end
    
  end
end

















