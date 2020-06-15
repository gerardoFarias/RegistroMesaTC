mapboxgl.accessToken = 'pk.eyJ1IjoiZ2VyZmFyZ2FsIiwiYSI6ImNrYmJmbWI5OTAwdDYyenFlNHR6bmk0MWsifQ.npsztI6PtqfmdB3KksJlfA';
var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v11',
center: [-79.4512, 43.6568],
zoom: 13
});

var geocoder = new MapboxGeocoder({
accessToken: mapboxgl.accessToken,
mapboxgl: mapboxgl
});

document.getElementById('geocoder').appendChild(geocoder.onAdd(map));
console.log(mapboxgl);
/*****COMPLETAR SELECT DE  REGION *** */
$.ajax(
  { url:"/Techo-chile/api/regions.php",
    method:"GET",
    dataType:"json"
  }
  ).done(function(data){
      
     console.log(data)
      llenarRegiones(data.regiones)
  }).fail(function(){});
  
  
  var llenarRegiones=function(data){
      var select = $("#SelecRegion");
     select.html("");
     data.forEach(e=>{
          var opt  = "<option value='"+e.id+"'>"+e.region+"</option>";
          select.append(opt); 
     })
  };
  /*****cargar provincias al select**** */
  $("#SelecRegion").change(function(id){
  
    cargarProvincias($(this).val());
   
  });
  var cargarProvincias=function(idRegion){
    $.ajax(
               { 
                 url:"/Techo-chile/api/provincias.php?id="+idRegion,
                 method:"GET",
                 datatype:"json"             
  
               }).done(function(data){
                     llenarProvincia(data.provincias);
  
               });
  
  };
  
  
  var llenarProvincia=function(data){
      var select = $("#SelePro");
     select.html("");
     data.forEach(e=>{
          var opt  = "<option value='"+e.region_id+"'>"+e.provincia+"</option>";
          select.append(opt); 
     })
  };

  /****CARGAR COMUNAS AL SELECT **** */

  $("#SelePro").change(function(idC){
  
    cargarComunas($(this).val());
   
  });
  var cargarComunas=function(idComuna){
    $.ajax(
               { 
                 url:"/Techo-chile/api/comunas.php?id="+idComuna,
                 method:"GET",
                 datatype:"json"             
  
               }).done(function(data){
                     llenarComunas(data.comunas);
  
               });
  
  };
  
  
  var llenarComunas=function(data){
      var select = $("#SelectCom");
     select.html("");
     data.forEach(e=>{
          var comu  = "<option value='"+e.provincia_id+"'>"+e.comuna+"</option>";
          select.append(comu); 
     })
  };



/******BUSCADOR **** */
$.ajax(
  { url:"/Techo-chile/api/regions.php",
    method:"GET",
    dataType:"json"
  }
  ).done(function(data){
      
   
      llenarRegionesB(data.regiones)
  }).fail(function(){});
  
  
  var llenarRegionesB=function(data){
      var select = $("#consultaRegion");
     select.html("");
     data.forEach(e=>{
          var optBR  = "<option value='"+e.id+"'>"+e.region+"</option>";
          select.append(optBR); 
     })
  };
/******BUSCADOR  provincia**** */



$("#consultaRegion").change(function(id){
  
  cargarProvinciasB($(this).val());
 
});
var cargarProvinciasB=function(idProvinciaB){
  $.ajax(
             { 
               url:"/Techo-chile/api/provincias.php?id="+idProvinciaB,
               method:"GET",
               datatype:"json"             

             }).done(function(data){
                   llenarProvinciaB(data.provincias);

             });

};


var llenarProvinciaB=function(data){
    var select = $("#consultaProvincia");
   select.html("");
   data.forEach(e=>{
        var optB  = "<option value='"+e.region_id+"'>"+e.provincia+"</option>";
        select.append(optB); 
   })
};


/*****************BUcador COMUNA*** */

$("#consultaProvincia").change(function(id){
  
  cargarComunaB($(this).val());
 
});
var cargarComunaB=function(idComunaB){
  $.ajax(
             { 
               url:"/Techo-chile/api/comunas.php?id="+idComunaB,
               method:"GET",
               datatype:"json"             

             }).done(function(data){
                   llenarComunasB(data.comunas);

             });

};


var llenarComunasB=function(data){
    var select = $("#consulComuna");
   select.html("");
   data.forEach(e=>{
        var optC  = "<option value='"+e.region_id+"'>"+e.comuna+"</option>";
        select.append(optC); 
   })
};


/*****************BUcador comunidad*** */


$("#consulComuna").change(function(id){
  
  cargarComunidadB($(this).val());
 
});
var cargarComunidadB=function(idComuniB){
  $.ajax(
             { 
               url:"/Techo-chile/api/mesaTrabajo.php?idComuna="+idComuniB,
               method:"GET",
               datatype:"json"             

             }).done(function(data){
                   llenarComunidadB(data.mesasTrabajos);
                   techo.hiddenSpinnerLG();

             });

};


var llenarComunidadB=function(data){
    var select = $("#consulComuni");
   select.html("");
   data.forEach(e=>{
        var optCo  = "<option value='"+e.region+"'>"+e.comunidad+"</option>";
        select.append(optCo); 
   })
};




/****FIN DE BUSCADOR***** */
/* function validar(){
region = document.getElementById("SelecRegion").value;
provincia =document.getElementById("SelePro").value; 
comuna = document.getElementById("SelectCom").value;
comunidad= document.getElementById("ingComunidad").value;
nombre= document.getElementById("IngNombre").value;
buscador = document.getElementById("search_input").value;
console.log(buscador);

if(nombre == "" || provincia == "" || comuna == "" || comunidad == "" || nombre == "" || buscador == "")  
{
  return false;
}else
{
  return true;
}



} */





   

    
