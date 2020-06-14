//$(document).ready(function(){


    mapboxgl.accessToken = 'pk.eyJ1IjoiZ2VyZmFyZ2FsIiwiYSI6ImNrYmJmbWI5OTAwdDYyenFlNHR6bmk0MWsifQ.npsztI6PtqfmdB3KksJlfA';
    var map = new mapboxgl.Map({
                    container: 'map',
                    style: 'mapbox://styles/mapbox/streets-v11',
                    center:[-70.669266,-33.448891],
                    zoom:10
              });

    var llenarRegiones=function(data){
    var select = $("#regiones");
       select.html("");
       data.forEach(e=>{
            var opt  = "<option value='"+e.region_techo+"'>"+e.region+"</option>";
            select.append(opt); 
       })
    }

    techo.showSpinnerLG();
    $.ajax(
    { url:"/Techo-chile/api/regions.php",
      method:"GET",
      dataType:"json"
    }
    ).done(function(data){  
        techo.hiddenSpinnerLG();
        console.log(data)
        llenarRegiones(data.regiones)
    }).fail(function(){
        techo.hiddenSpinnerLG();

    });

    
    

     
    
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

    var llenarTabla= function(data){
          var select = $('#tabla');
          var descRegion=$("#regiones > option:checked").text()

          if(data.length>0){
              select.html("");
              data.forEach(e=>{
                 var tab ="<tr>"+"<td >"+e.nombre+"</td>"+"<td >"+e.comunidad+"</td>"+"<td >"+descRegion+"</td>"+"</tr>"
                      select.append(tab); 
              });
                marcadorMapa(data);
          }else{
              select.html("<tr class=''><td class='' colspan='3'>Sin Información</td></tr>");
          }


    };


    


    /*
    var geocoder = new MapboxGeocoder({
                      accessToken: mapboxgl.accessToken,
                      mapboxgl: mapboxgl
                   });
    */



    var marcadorMapa = function(data){

        let geojson=techo.convertGeoJson(data);
     

        geojson.features.forEach(function(marker,index) {

            if(index===1 ){
                map.setCenter(marker.geometry.coordinates);
            }

          // create a HTML element for each feature
          var el = document.createElement('div');
          el.className = 'marker';
             console.log("marker.geometry.coordinates:",marker.geometry.coordinates);  
              //console.log("marker.geometry.coordinates:",marker.geometry.coordinates);  


          // make a marker for each feature and add to the map
             new mapboxgl.Marker(el)
              .setLngLat(marker.geometry.coordinates)
              .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
                .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>'))
              .addTo(map);
        });

  }


  //});