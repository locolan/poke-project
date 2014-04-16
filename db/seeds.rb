response = []
response << HTTParty.get('http://www.pokeapi.co/api/v1/pokedex/1/')
pokemon_data = JSON.generate(response)
pokemon_data = JSON.parse(pokemon_data)

pokemon_data.map do |data|   
  data['pokemon'].each do |p|
    puts p['name']
    poke = Pokemon.new
    poke.name = p['name']
    poke.resource_uri = p['resource_uri']
    poke.save
  end
end
