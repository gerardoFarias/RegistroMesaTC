
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
  
  
  $("#regiones").change(function(){
  
    cargarProvincia($(this).val());
   
  });
  var cargarProvincia=function(idRegion){
  
  
       $.ajax(
               { 
                 url:"/Techo-chile/api/provincias.php?id=" +idRegion,
                 method:"GET",
                 datatype:"json"             
  
               }).done(function(data){
                     llenarComunas(data.provincias);
  
               });
  
  };
  
  
  var llenarComunas=function(data){
      var select = $("#SelePro");;
     select.html("");
     data.forEach(e=>{
          var opt  = "<option value='"+e.id+"'>"+e.provincia+"</option>";
          select.append(opt); 
     })
  };
  
  
  
  
  












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










    $("#regiones").change(function(){
    
      cargarMesasDeTrabajo($(this).val());
     //cargarProvincia($(this).val());
     
    });

    var cargarMesasDeTrabajo = function(idRegion){
      techo.showSpinnerLG();
      $.ajax(
        { 
          url:"/Techo-chile/api/mesaTrabajo.php?idRegion=" +idRegion,
          method:"GET",
          datatype:"json"             

        }).done(function(data){

            console.log(data)
            var dtTbl = data.mesasTrabajos?data.mesasTrabajos:[]; 
            llenarTabla(dtTbl);
            techo.hiddenSpinnerLG();
        
        });
    };
