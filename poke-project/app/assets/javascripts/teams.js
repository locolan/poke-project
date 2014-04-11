$(document).ready(function(){
  
  $.ajax({
    type: 'GET',
    url: '/get_pokemon',
    dataType: 'json',
    data: {team_id: window.location.href.lastIndexOf('/') + 1)},
    success: function(data){
      var current = 1;
      
      for(var i = 1; i <= 6; i++){
        current = i;
        var appendPokemon = function (r){
          var requestURL = "http://www.pokeapi.co/" + data.sprites[0].resource_uri;
          console.log(requestURL);
          console.log(data.name);
          var pokeSprite = $.ajax({
            type: 'GET',
            url: '/search',
            dataType: 'json',
            data: {uri: data.sprites[0].resource_uri, resource: 'sprite'},
            timeout: 3000,
            success: function (r){
              var imageURL = "http://www.pokeapi.co/" + r.image;
              var type;
              if(data.types.length === 1){
                type = "<li>Type: " + data.types[0].name + "</li>";
              } else{
                type = "<li>Types: " + data.types[0].name + " and " + data.types[1].name + "</li>";
              }
              var evolution = "";
              if(data.evolutions.length > 0){
                evolution = "<li>Evolution: " + data.evolutions[0].to + "</li>";
              }
              var species = "";
              if(data.species !== ""){
                species = "<li>Species: " + data.species + "</li>";
              }
              var totalStats = data.attack + data.sp_atk + data.hp + data.defense + data.sp_def + data.speed;          
              console.log(imageURL);
              if($.find(".p"+current)){
                $(".p"+current).append("<li><img alt='" + r.name + "' src='"+ imageURL +"'></img></li>" +
                "<li>Name: " + data.name + "</li>" +
                species + 
                type +
                "<li>Weight: " + data.weight + "pounds</li>" +
                evolution +
                "<li>Stats: </li>" +
                "<li>Attack:" + "      " + data.attack + "</li>" +
                "<li>Sp. Attack:"+ "  " + data.sp_atk + "</li>" +
                "<li>HP:"+ "          " + data.hp + "</li>" +
                "<li>Defense:"+ "     " + data.defense + "</li>" +   
                "<li>Sp. Defense:"+" " + data.sp_def + "</li>" +
                "<li>Speed:"+ "       " + data.speed + "</li>" +
                "<li>Total:"+ "       " + totalStats + "</li>" 
              )}                   
            },
            error: function(data, textStatus, errorThrown){
              console.log(data.error);
            } 
          });
        }
      }
    }
  });
  
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