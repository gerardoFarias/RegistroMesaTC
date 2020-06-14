techo={};

//$(function(){

techo.spinnerLG=$('<div class="modal  spinner-modal-lg"  id="spinnerModal"  data-backdrop="static" data-keyboard="false" tabindex="-1">\
                        <div class="modal-dialog modal-sm" style="text-align: center;">\
                     <span class="fa fa-circle-notch fa-spin fa-3x" aria-hidden="true" style="color:white"></span>\
                    </div>\
                    </div>');

 techo.showSpinnerLG = function(){
     techo.spinnerLG.modal('show');
 }

 techo.hiddenSpinnerLG=function(){
     techo.spinnerLG.modal('hide')
 }


 techo.addWarning = function(msj){
  
         var html = '<div class="alert alert-warning alert-dismissible fade show" role="alert">\
                      <strong>'+msj+'</strong>\
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                        <span aria-hidden="true">&times;</span>\
                      </button>\
                    </div>';
       

 }


 var geojson = {
     
          type: 'FeatureCollection',
          features: []
  };

techo.addPoint= function(g){
    return g.substring(0,3) +"."+ g.substring("3",g.length) ;


}

techo.convertGeoJson=function(data){
  var geojson = {     
          type: 'FeatureCollection',
          features: []
   };
   geojson.features = data.filter(e=> $.isNumeric(e.latitud) &&  $.isNumeric(e.longitud) ).map(e=>{  
                        
                        if(e.latitud.indexOf(".") === -1){
                           e.latitud=techo.addPoint(e.latitud);
                         }
                               
                        if(e.longitud.indexOf(".") === -1){
                           e.longitud=techo.addPoint(e.longitud);
                         }
                     console.log("e.latitud:"+e.latitud+" e.longitud:"+e.longitud);  

                     
                     return  {
                        type: 'Feature',
                        geometry: {
                          type: 'Point',
                          coordinates: [e.longitud *1, e.latitud * 1]
                        },
                        properties: {
                          title: 'Comunidad',
                          description: e.comunidad
                        }
                      };
       
                 });
   return geojson;
}


//});//end ready

