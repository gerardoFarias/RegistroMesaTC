<?php 
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    include_once '../service/locationService.php';
    
    
    $api = new locationService();

    switch($_SERVER['REQUEST_METHOD']){
        case 'GET':
            $idRegion = $_GET['id'];
            $api->getProvinciasByRegion($idRegion);
        break;
        case 'POST':
            echo json_encode('Metodo POST no implementado');
        break;
        case 'PUT':
            echo json_encode('Metodo PUT no implementado');
        break;
        case 'DELETE':
            echo json_encode('Metodo DELETE no implementado');
        break;
        default:
            echo json_encode('Metodo no soportado');
    }    

?>