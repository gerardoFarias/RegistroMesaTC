<?php

 require '../config/db.php';

    class Localizacion extends DB {



function legeo(){

 $nombre= $_POST["usuario"];
 $pass= $_POST["pass"];
 $query= $this->connect()->prepare("SELECT nombres,pass FROM  techochile.tr_usuario WHERE nombres= '".$nombre."' and pass = '".$pass."'");

 $nr = mysqli_num_rows($query,connet());
  if($nr == 1)
  {
      
      header("location:../vistas/registroMesa.html");
 }
 else if($nr == 0) {

   echo "falla de inicio";

}
return $query;
}
}
?>