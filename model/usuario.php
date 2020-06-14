<?php
    include_once '../config/db.php';

    class Usuario extends DB {

        function obtenerUsuarios(){
            $query = $this->connect()->query('SELECT * FROM techochile.tr_usuario');
            return $query;
        }

        function obtenerOneUser($id){
            $query = $this->connect()->prepare('SELECT * FROM techochile.tr_usuario WHERE id = :id');
            $query->execute(['id' => $id]);
            return $query;
        }

        function addUser($entity){
            $query = $this->connect()->prepare('INSERT INTO techochile.tr_usuario(nombres,apellido_paterno,apellido_materno,email,password,estado,perfil_id) VALUES(:nombres,:apellido_paterno,:apellido_materno,:email,:password,:estado,:perfil_id)');

            $querySucces = $query->execute(['nombres'=>$entity->{'nombres'},
                                            'apellido_paterno'=>$entity->{'apellido_paterno'},
                                            'apellido_materno'=>$entity->{'apellido_materno'}, 
                                            'email'=>$entity->{'email'},
                                            'password'=>$entity->{'password'},
                                            'estado'=>$entity->{'estado'},
                                            'perfil_id'=>$entity->{'perfil_id'}]);
            
            return $querySucces;
        }

        function modifyUserExist($entity){
            $query = $this->connect()->prepare('UPDATE techochile.tr_usuario SET nombres = :nombres, apellido_paterno = :apellido_paterno, apellido_materno = :apellido_materno, email = :email, password = :password,estado = :estado, perfil_id = :perfil_id WHERE id = :id');

            $querySucces = $query->execute(['id'=>$entity->{'id'},'nombres'=>$entity->{'nombres'},'apellido_paterno'=>$entity->{'apellido_paterno'},'apellido_materno'=>$entity->{'apellido_materno'}, 'email'=>$entity->{'email'},'password'=>$entity->{'password'},'estado'=>$entity->{'estado'},'perfil_id'=>$entity->{'perfil_id'}]);
            
            return $querySucces;
        }

        function deleteUserExist($id){

            // No eliminamos al usuario solo lo desactivamos
            $query = $this->connect()->prepare('UPDATE techochile.tr_usuario SET estado = 0  WHERE id = :id;');
            $querySucces = $query->execute(['id' => $id]);
            
            return $querySucces;
        }
    }
?>