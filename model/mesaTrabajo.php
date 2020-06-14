<?php
    include_once '../config/db.php';

    class MesaTrabajo extends DB {

        function obtenerMesasTrabajos(){
            $query = $this->connect()->query('SELECT * FROM techochile.tr_mesa_trabajo');
            return $query;
        }

        function obtenerMesasTrabajosByRegion($idTecho){
            $query = $this->connect()->prepare('SELECT mtrabajo.id, mtrabajo.nombre ,mtrabajo.comunidad ,mtrabajo.latitud, mtrabajo.longitud, mtrabajo.estado, mtrabajo.comuna_id
                                                FROM techochile.tr_mesa_trabajo mtrabajo
                                                INNER JOIN techochile.cons_comuna ccomuna
                                                ON mtrabajo.comuna_id = ccomuna.id
                                                INNER JOIN techochile.cons_provincia cprovincia
                                                ON cprovincia.id = ccomuna.provincia_id
                                                INNER JOIN techochile.cons_region cregion
                                                ON cregion.id = cprovincia.region_id
                                                WHERE cregion.region_techo = :idTecho');
            $query->execute(['idTecho' => $idTecho]);
            return $query;
        }

        function obtenerMesasTrabajosByComuna($id){
            $query = $this->connect()->prepare('SELECT * FROM techochile.tr_mesa_trabajo where comuna_id = :id');
            $query->execute(['id' => $id]);
            return $query;
        }

        function addMesaTrabajo($entity){
            $query = $this->connect()->prepare('INSERT INTO techochile.tr_mesa_trabajo(nombre,comunidad,latitud,longitud,estado,comuna_id) VALUES(:nombre,:comunidad,:latitud,:longitud,:estado,:comuna_id)');
            
            $querySucces = $query->execute(['nombre'=>$entity->{'nombre'},
                                            'comunidad'=>$entity->{'comunidad'},
                                            'latitud'=>$entity->{'latitud'}, 
                                            'longitud'=>$entity->{'longitud'},
                                            'estado'=>$entity->{'estado'},
                                            'comuna_id'=>$entity->{'comuna_id'}]);
            return $querySucces;
        }

        function modifyMesaTrabajoExist($entity){
            $query = $this->connect()->prepare('UPDATE techochile.tr_mesa_trabajo SET nombre = :nombre, comunidad = :comunidad, latitud = :latitud, longitud = :longitud, estado = :estado, comuna_id = :comuna_id WHERE id = :id;');

            $querySucces = $query->execute(['id'=>$entity->{'id'},'nombre'=>$entity->{'nombre'},'comunidad'=>$entity->{'comunidad'},'latitud'=>$entity->{'latitud'}, 'longitud'=>$entity->{'longitud'},'estado'=>$entity->{'estado'},'comuna_id'=>$entity->{'comuna_id'}]);
            
            return $querySucces;
        }

        function deleteMesaTrabajoExist($id){

            $query = $this->connect()->prepare('DELETE FROM techochile.tr_mesa_trabajo WHERE id = :id;');
            $querySucces = $query->execute(['id' => $id]);
            
            return $querySucces;
        }
    }
?>