<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link href="css/Estilos.css" type="text/css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div id="inicio">
        <div class="item-a">
            <h2></h2>
         </div>
          <div class="item-b">
            <a href="./usuarios.jsp">Usuarios</a>
            <a href="./clientes.jsp">Clientes</a>
            <a href="./proveedores.jsp">Proveedores</a>
            <a href="./productos.jsp">Productos</a>
            <a href="./ventas.jsp">Ventas</a>
            <a href="./reportes.jsp">Reportes</a>
          </div>
    </div>

    <div id="reusuario">
      <form action="GestionUsuarios.jsp" method="POST">
            <table>
                <tr class="elemento">
                 <td>
                        <label for="document">Cédula</label>
                        <input type="text" id="document" name="cedula_usuario"/>
                    </td>
                    <td>
                    <label for="user">Usuario</label>
                    <input type="text" id="user" name="usuario"/>
                </td>
                </tr>
                
                <tr class="elemento">
                    <td>
                        <br>
                        <label for="name">Nombre Completo</label>
                        <input type="text" id="name" name="nombre_usuario"/>
                    </td>
                    <td>
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="contrasena"/>
                </tr>
                <tr class="elemento">
                    <td>
                        <br>
                        <label for="mail">Correo Electrónico</label>
                        <input type="email" id="mail" name="email_usuario"/>
                    </td>
                </tr>
                <tr class="botones">
                    <td>
                    	<input type="submit" name="boton" value="Consultar"/>
                    	<input type="submit" name="boton"  value="Crear"/>
                    	<input  type="submit" name="boton"value="Actualizar"/>
                    	<input type="submit" name="boton" value="Borrar"/>
                    </td>
                </tr>
            </table> 
       </form> 
    </div>
</body>
</html>
    