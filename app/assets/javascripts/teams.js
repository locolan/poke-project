$(document).ready(function(){

  if($(".team").length > 0){
    $.ajax({
      type: 'GET',
      url: '/get_pokemon',
      dataType: 'json',
      data: {team_id: window.location.href.substr(window.location.href.lastIndexOf('/') + 1)},
      success: function(data){
        console.log(data);
        // data = JSON.parse(data);
        


        for(var i = 1; i <= 6; i++){
          var currentElement = i;
          var currentPokemon = data["p"+i]; 
          var requestURL = "http://www.pokeapi.co/" + currentPokemon.sprites[0].resource_uri;
          console.log(requestURL);
          console.log(currentPokemon.name);
          $.ajax({
            async:false,
            type: 'GET',
            url: '/search',
            dataType: 'json',
            data: {uri: currentPokemon.sprites[0].resource_uri, resource: 'sprite'},
            timeout: 3000,
            success: function (r){
              var imageURL = "http://www.pokeapi.co/" + r.image;
              var type;
              if(currentPokemon.types.length === 1){
                type = "<li>Type: " + currentPokemon.types[0].name + "</li>";
              } else{
                type = "<li>Types: " + currentPokemon.types[0].name + " and " + currentPokemon.types[1].name + "</li>";
              }
              var evolution = "";
              if(currentPokemon.evolutions.length > 0){
                evolution = "<li>Evolution: " + currentPokemon.evolutions[0].to + "</li>";
              }
              var species = "";
              if(currentPokemon.species !== ""){
                species = "<li>Species: " + currentPokemon.species + "</li>";
              }
              var totalStats = currentPokemon.attack + currentPokemon.sp_atk + currentPokemon.hp + currentPokemon.defense + currentPokemon.sp_def + currentPokemon.speed;          
              console.log(imageURL);
              console.log(currentPokemon.name)
              
              $("#p"+currentElement).append("<li><img alt='" + r.name + "' src='"+ imageURL +"'></img></li>" +
              "<li>Name: " + currentPokemon.name + "</li>" +
              species + 
              type +
              "<li>Weight: " + currentPokemon.weight + " pounds</li>" +
              evolution +
              "<li>Stats: </li>" +
              "<li>Attack:" + currentPokemon.sp_atk + "</li>" +
              "<li>HP:"+ currentPokemon.hp + "</li>" +
              "<li>Defense: " + currentPokemon.defense + "</li>" +   
              "<li>Sp. Defense:"+ currentPokemon.sp_def + "</li>" +
              "<li>Speed:"+ currentPokemon.speed + "</li>" +
              "<li>Total:"+ totalStats + "</li>" 
            );                   
          }
        });
          
        
      }
    },
    error: function(data){
      console.log(data.error);
      console.log(data);
      console.log(window.location.href.substr(window.location.href.lastIndexOf('/') + 1))
    }
  });
}
// ------------------------------------------------------------------ //
  
$("#save").click(function(event){
    
  var pokemon = [];
  for(var i = 1; i <= 6; i++){
    pokemon[i] = $("[placeholder='Pokemon " + i + "']").val();
    console.log(pokemon[i]);
  }
    
    
  $.ajax({
    type: 'GET',
    url: '/teams/new',
    dataType: 'json',
    data: {pokemon: pokemon},
    timeout: 3000,
    success: function(data){
      window.location.href = "/teams/" + data.id
    },
    error: function(data){
      console.log(data.error);
    }
  });
    
    
  event.preventDefault();
});
});