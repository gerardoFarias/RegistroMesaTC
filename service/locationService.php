<?php

    include_once '../model/localizacion.php';

    class locationService {

        function getRegion(){
            $localizacion = new Localizacion();
            $region = array();

            $region["regiones"] = array();

            $res = $localizacion->getRegions();

            if($res->rowCount()){
                while($row = $res->fetch(PDO::FETCH_ASSOC)){
                    $item = array(
                        'id' => $row['id'],
                        'region' => $row['region'],
                        'region_techo'=>$row['region_techo']
                    );

                    array_push($region["regiones"],$item);
                }
                $this->printJSON($region);
            }else{
                $this->error('No hay elementos registrados');
            }
        }

        function getProvinciasByRegion($id){
            $localizacion = new Localizacion();
            $provincias = array();

            $provincias["provincias"] = array();

            $res = $localizacion->getProvincias($id);

            if($res->rowCount()){
                while($row = $res->fetch(PDO::FETCH_ASSOC)){
                    $item = array(
                        'id' => $row['id'],
                        'provincia' => $row['provincia'],
                        'region_id' => $row['region_id']
                    );

                    array_push($provincias["provincias"],$item);
                }
                $this->printJSON($provincias);
            }else{
                $this->error('No hay elementos registrados');
            }
        }

        function getComunasByProvincias($id){
            $localizacion = new Localizacion();
            $comunas = array();

            $comunas["comunas"] = array();

            $res = $localizacion->getComunas($id);

            if($res->rowCount()){
                while($row = $res->fetch(PDO::FETCH_ASSOC)){
                    $item = array(
                        'id' => $row['id'],
                        'comuna' => $row['comuna'],
                        'provincia_id' => $row['provincia_id']
                    );

                    array_push($comunas["comunas"],$item);
                }
                $this->printJSON($comunas);
            }else{
                $this->error('No hay elementos registrados');
            }
        }

       

        function success($mensaje){
            echo json_encode(array('mensaje' => $mensaje));
        }

        function printJSON($array){
            echo  json_encode($array) ;
        }

        function error($mensaje){
            echo json_encode(array('mensaje' => $mensaje));
        }
    }

?>