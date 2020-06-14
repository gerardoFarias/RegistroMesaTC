<?php
    include_once '../config/db.php';

    class Localizacion extends DB {

     function getRegions(){
            $query = $this->connect()->query('SELECT * FROM techochile.cons_region');
            return $query;
        }
      
        function getProvincias($id){
            $query = $this->connect()->prepare('SELECT * FROM techochile.cons_provincia WHERE region_id = :idRegion');
            $query->execute(['idRegion' => $id]);
            return $query;
        }

        function getComunas($id){
            $query = $this->connect()->prepare('SELECT * FROM techochile.cons_comuna WHERE provincia_id = :idProvincia');
            $query->execute(['idProvincia' => $id]);
            return $query;
        }

    }
?>