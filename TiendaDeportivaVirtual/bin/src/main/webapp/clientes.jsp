<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
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

    <div id="reclientes">
        <form action="GestionClientes.jsp" method="POST">
            <table>
                <tr>
                    <td>
                        <label for="document">Cédula</label>
                        <input type="text" id="document" name="cedula_cliente"/>
                    </td>
                    <td>
                        <label for="phone">Teléfono</label>
                        <input type="text" id="phone" name="telefono_cliente"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <label for="name">Nombre Completo</label>
                        <input type="text" id="name" name="nombre_cliente"/>
                    </td>
                    <td>
                        <label for="mail">Correo Electrónico</label>
                        <input type="email" id="mail" name="email_cliente"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <label for="address">Dirección</label>
                        <input type="text" id="address" name="direccion_cliente"/>
                    </td>
                </tr>
                <tr class="botones">
                    <td><input type="submit" name="boton" value="Consultar"/>
                        <input type="submit" name="boton" value="Crear"/>
                        <input type="submit" name="boton" value="Actualizar" />
                        <input type="submit" name="boton" value="Borrar"/>
                    </td>
                </tr>
            </table>    
        </form>
    </div>
</body>
</html>