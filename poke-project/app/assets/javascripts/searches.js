$(document).ready(function(){
  jQuery.fn.exists = function(){return this.length>0;}
  if($("#result").exists()){
    function appendPokemon(data){
      if($.find("li")){
        $("li").remove();
      }
      var requestURL = "http://www.pokeapi.co/" + data.sprites[0].resource_uri;
      console.log(requestURL);
      var pokeSprite = $.ajax({
        type: 'GET',
        url: requestURL,
        dataType: 'jsonp',
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
          if($.find("#result")){
            $("#result").append("<li><img alt='" + r.name + "' src='"+ imageURL +"'></img></li>" +
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
        }
      });
      event.preventDefault();
    }
                        
    $("form").on("submit", function(event){
                      
      var query = $("input[name=query]").val();
      var requestURL="";
      console.log(query);
      var request = $.ajax({
        type: 'GET',      
        url: 'http://pokeapi.co/api/v1/pokedex/1',
        dataType: 'jsonp',
        success: function(r){
          requestURL = "http://www.pokeapi.co/" + encodeURI(r.pokemon[r.pokemon.map(function(e){return e.name;}).indexOf(query.toLowerCase())].resource_uri);
          $.ajax({
            type: 'GET',
            url: requestURL,
            dataType: 'jsonp',
            timeout: 3000,
            success: function(r2){
              appendPokemon(r2);
            }
          });
        },
        timeout: 3000
      });
    
    
    
    
      event.preventDefault();
                                  
    });
  }                         
});
