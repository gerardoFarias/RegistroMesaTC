<?php 
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    include_once '../service/mesaTrabajoService.php';
    
    
    
    $api = new MesaTrabajoService();

    switch($_SERVER['REQUEST_METHOD']){
        case 'GET':
            if(isset($_GET['idComuna'])){
                $idComuna = $_GET['idComuna'];
                if(is_numeric($idComuna)){
                    $api->getByIdComuna($idComuna);
                }else{
                    $api->error('El parametro debe ser numerico');
                }
            }else if($_GET['idRegion']){
                $idRegion = $_GET['idRegion'];
                if(is_numeric($idRegion)){
                    $api->getByIdTecho($idRegion);
                }else{
                    $api->error('El parametro debe ser numerico');
                }
            }
            else{
                $api->getAll();
            }
        break;
        case 'POST':
            $entity = json_decode(file_get_contents('php://input'));
            $api->addNewMesaTrabajo($entity);
            
        break;
        case 'PUT':
            $entity = json_decode(file_get_contents('php://input'));
            $api->modifyTrabajo($entity);
        break;
        case 'DELETE':
            $idMesaTrabajo = $_GET['id'];
            $api->deleteTrabajo($idMesaTrabajo);
        break;
        default:
            echo json_encode('Metodo no soportado');
    }    

?>