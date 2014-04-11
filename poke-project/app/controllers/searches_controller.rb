class SearchesController < ApplicationController
  def search
    # params[data-name] - passed from the AJAX call, will be used to find 
    #    national id from resource_uri attribute in @pokemon
    # n - id number of resource, in our case the national id of a pokemon
    # resource - pokemon
    
    # getting resource_uri from pokemon stored in db
    # if(params[:name_arr])
    #   r = []
    #   r2 = []
    #   r3 = []
    #   params[:name].each do |p| 
    #     puts p
    #     r << Pokemon.where("name LIKE ?", "%#{p}%")[0].resource_uri
    #     puts r
    #   end
    #   
    #   # pokemon_path = Pokemon.where("name LIKE ?", "%#{params[:name]}%")[0].resource_uri
    #   
    #   r.each do |p| 
    #     r3 << Pokegem.get(params[:resource],p[15,p.length-16].to_i) 
    #   end
    #   
    #   result = JSON.parse(r3)
    #   result = JSON.generate(result)
      # result = Pokegem.get(params[:resource],pokemon_path[15,pokemon_path.length-16].to_i)
    if(params[:name])
      pokemon_path = Pokemon.where("name LIKE ?", "%#{params[:name]}%")[0].resource_uri
    else
      pokemon_path = params[:uri]
    end

    result = Pokegem.get(params[:resource],pokemon_path[15,pokemon_path.length-16].to_i)

    respond_to do |format|
      format.json { render json: result, :status => :ok}
    end
    
  end
end
