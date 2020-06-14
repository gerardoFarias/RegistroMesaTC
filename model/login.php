  <?php

session_start();
  
// Obtengo los datos cargados en el formulario de login.
$email = $_POST['usuario'];
$password = $_POST['password'];

// Datos para conectar a la base de datos.
$nombreServidor = "localhost";
$nombreUsuario = "root";
$passwordBaseDeDatos = "";
$nombreBaseDeDatos = "techochile";

// Crear conexión con la base de datos.
$conn = new mysqli($nombreServidor, $nombreUsuario, $passwordBaseDeDatos, $nombreBaseDeDatos);





 $nombre= $_POST["usuario"];
 $pass= $_POST["password"];
 $query=mysqli_query($conn,"SELECT * FROM  techochile.tr_usuario WHERE nombres='$nombre' AND pass='$pass'");

 $result=mysqli_num_rows($query);



   

    if($result > 0)

    {

            $data = mysqli_fetch_array($query);
            header("location:../vistas/registroMesa.html");
    
        }
else
{
    header("location:../vistas/index.html");
}




?>
