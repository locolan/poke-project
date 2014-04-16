$(document).ready(function(){

  var current = 1;



  var appendPokemon = function (pokemon_arr){
    var requestURL,pokeSprite, imageURL, type, evolution, species, totalStats;
    for(var i=1; i<=6; i++){
      var data = pokemon_arr[i];
      current = i;
      console.log("current: " + current + ", i: " + i);
      requestURL = "http://www.pokeapi.co/" + data.sprites[0].resource_uri;
      pokeSprite = $.ajax({
        async: false,
        type: 'GET',
        url: '/search',
        dataType: 'json',
        data: {uri: data.sprites[0].resource_uri, resource: 'sprite'},
        timeout: 3000,
        success: function (r){
          imageURL = "http://www.pokeapi.co/" + r.image;
          type="";
      
          if(data.types.length === 1){
            type = "<li>Type: " + data.types[0].name + "</li>";
        
          } else{
            type = "<li>Types: " + data.types[0].name + " and " + data.types[1].name + "</li>";
        
          }
      
          evolution = "";
          if(data.evolutions.length > 0){
            evolution = "<li>Evolution: <button id='evolution_botton'>" + data.evolutions[0].to + "</button></li>";
          }
      
          species = "";
          if(data.species !== ""){
            species = "<li>Species: " + data.species + "</li>";
          }
      
          totalStats = data.attack + data.sp_atk + data.hp + data.defense + data.sp_def + data.speed;          
      
          console.log(imageURL);

          $("#search_container").append("<ul id='p"+ current +"'><li><img alt='" + r.name + "' src='"+ imageURL +"'></img></li>" +
          "<li>Name: " + data.name + "</li>" +
          species + 
          type +
          evolution +
          "<li>Stats: </li>" +
          "<li>Attack:" + data.attack + "</li>" +
          "<li>Sp. Attack:"+ data.sp_atk + "</li>" +
          "<li>HP:"+ data.hp + "</li>" +
          "<li>Defense:"+ data.defense + "</li>" +   
          "<li>Sp. Defense:"+ data.sp_def + "</li>" +
          "<li>Speed:"+ data.speed + "</li>" +
          "<li>Total:"+ totalStats + "</li></ul> ");                   
        },
        error: function(data, textStatus, errorThrown){
          console.log(data.error);
        } 
      });
      if($("#index").length > 0){
        break;
      }
      if(i === 6){
        break;
      }
    }
  }

  // button 'submit' will initiate this event - this is the search button
  $("form").on("submit", function(event){
    var query;
    var pokemon_arr = [];
    $("ul").remove();
    if($("[placeholder='Pokemon 1']").val().toLowerCase() === "mr pickles" || "mrpickles" || "mr. pickles"){
      $("#search_container").append("<ul><img src='pickles.png'>mr pickles<img></ul>");
    } else {
      for(var i = 1; i <= 6; i++){
        query = $("[placeholder='Pokemon " + i + "']").val().toLowerCase();
      
        console.log(query);
        
        $.ajax({
          async: false,
          type: 'GET',
          url: "/search",
          dataType: 'json',
          data: {name: query, resource: 'pokemon'},
          timeout: 3000,
          success: function(data){
            pokemon_arr[i] = data;
        
          },
          error: function(data, textStatus, errorThrown){
            console.log(errorThrown);
          }
        });
        if($("#index").length > 0){
          break;
        }
        if(i === 6){
          break;
        }
      }
    }
    appendPokemon(pokemon_arr);
    event.preventDefault();                               
  }); 


});