<?php

    include_once '../model/mesaTrabajo.php';

    class MesaTrabajoService {

        function getAll(){
            $mesaTrabajo = new MesaTrabajo();
            $mesasTrabajos = array();

            $mesasTrabajos["mesasTrabajos"] = array();

            $res = $mesaTrabajo->obtenerMesasTrabajos();

            if($res->rowCount()){
                while($row = $res->fetch(PDO::FETCH_ASSOC)){
                    $item = array(
                        'id' => $row['id'],
                        'nombre' => $row['nombre'],
                        'comunidad' => $row['comunidad'],
                        'latitud' => $row['latitud'],
                        'longitud' => $row['longitud'],
                        'estado' => $row['estado'],
                        'comuna_id' => $row['comuna_id']
                    );

                    array_push($mesasTrabajos["mesasTrabajos"],$item);
                }
                $this->printJSON($mesasTrabajos);
            }else{
                $this->error('No hay elementos registrados');
            }
        }

        function getByIdTecho($idTecho){
            
            $mesaTrabajo = new MesaTrabajo();
            $mesasTrabajos = array();

            $mesasTrabajos["mesasTrabajos"] = array();

            $res = $mesaTrabajo->obtenerMesasTrabajosByRegion($idTecho);

            if($res->rowCount()){
                while($row = $res->fetch(PDO::FETCH_ASSOC)){
                    $item = array(
                        'id' => $row['id'],
                        'nombre' => $row['nombre'],
                        'comunidad' => $row['comunidad'],
                        'region' => $idTecho,
                        'latitud' => $row['latitud'],
                        'longitud' => $row['longitud'],
                        'estado' => $row['estado'],
                        'comuna_id' => $row['comuna_id']
                    );

                    array_push($mesasTrabajos["mesasTrabajos"],$item);
                }

            }
        
            
                // abrimos la sesión cURL
                $ch = curl_init();

                // definimos la URL a la que hacemos la petición
                curl_setopt($ch, CURLOPT_URL,"https://domain.chile.techo.org/api/v2/");
                // indicamos el tipo de petición: POST
                curl_setopt($ch, CURLOPT_POST, TRUE);
                // definimos cada uno de los parámetros
                curl_setopt($ch, CURLOPT_POSTFIELDS, "f=gms&region=".$idTecho);

                // recibimos la respuesta y la guardamos en una variable
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                
                $res = json_decode($remote_server_output = curl_exec ($ch));

                $res2 = $res->{'data'};

                foreach($res2 as $value){
                    
                    $item = array(
                        'id' => $value->{'id'},
                        'nombre' => $value->{'nombre'},
                        'comunidad' => $value->{'comunidad'},
                        'region' =>  $value->{'region'},
                        'latitud' => $value->{'latitud'},
                        'longitud' => $value->{'longitud'},
                        'estado' => 0,
                        'comuna_id' => 0
                    );
                    

                    array_push($mesasTrabajos["mesasTrabajos"],$item);
                }
                // cerramos la sesión cURL
                curl_close ($ch);

                //saco el numero de elementos
                $longitud = count($mesasTrabajos["mesasTrabajos"]);

                

                if($longitud > 0){
                    $this->printJSON($mesasTrabajos);
                }else{
                    $this->error('No hay elementos registrados');
                }
        }

        function getByIdComuna($id){
            $mesaTrabajo = new MesaTrabajo();
            $mesasTrabajos = array();

            $mesasTrabajos["mesasTrabajos"] = array();

            $res = $mesaTrabajo->obtenerMesasTrabajosByComuna($id);

            if($res->rowCount()){
                while($row = $res->fetch(PDO::FETCH_ASSOC)){
                    $item = array(
                        'id' => $row['id'],
                        'nombre' => $row['nombre'],
                        'comunidad' => $row['comunidad'],
                        'latitud' => $row['latitud'],
                        'longitud' => $row['longitud'],
                        'estado' => $row['estado'],
                        'comuna_id' => $row['comuna_id']
                    );

                    array_push($mesasTrabajos["mesasTrabajos"],$item);
                }
                $this->printJSON($mesasTrabajos);
            }else{
                $this->error('No hay elementos registrados');
            }
        }

        function addNewMesaTrabajo($entity){
            $mesaTrabajo = new MesaTrabajo();

            $res = $mesaTrabajo->addMesaTrabajo($entity);
            if($res){
                $this->success('Nuevo mesa de trabajo registrada');
            }else{
                $this->error('No se pudo insertar mesa de trabajo');
            }

            
        }


        function modifyTrabajo($entity){
            $mesaTrabajo = new MesaTrabajo();

            $res = $mesaTrabajo->modifyMesaTrabajoExist($entity);
            if($res){
                $this->success('Mesa de trabajo modificado correctamente');
            }else{
                $this->error('No se pudo modificar mesa de trabajo');
            }

        }

        function deleteTrabajo($id){
            
            $mesaTrabajo = new MesaTrabajo();
            $res = $mesaTrabajo->deleteMesaTrabajoExist($id);

            if($res){
                $this->success('Mesa de trabajo eliminado correctamente');
            }else{
                $this->error('No se pudo eliminar mesa de trabajo');
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