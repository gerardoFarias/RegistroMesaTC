<?php 
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    include_once '../service/usuarioService.php';
    
    
    $util = new Util();
    $api = new usuarioService();

    switch($_SERVER['REQUEST_METHOD']){
        case 'GET':
            if(isset($_GET['id'])){
                $idUser = $_GET['id'];
                if(is_numeric($idUser)){
                    $api->getById($idUser);
                }else{
                    $api->error('El parametro debe ser numerico');
                }
            }else{
                $api->getAll();
            }
        break;
        case 'POST':
            $entity = json_decode(file_get_contents('php://input'));
            $api->addNewUser($entity);
            
        break;
        case 'PUT':
            $entity = json_decode(file_get_contents('php://input'));
            $api->modifyUser($entity);
        break;
        case 'DELETE':
            $idUser = $_GET['id'];
            $api->deleteUser($idUser);
        break;
        default:
            echo json_encode('Metodo no soportado');
    }    

?>