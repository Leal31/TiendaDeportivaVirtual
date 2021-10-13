<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proveedores</title>
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

    <div id="reproveedores">
    	<form action="GestionProveedores.jsp" method="POST">
	        <table>
	            <tr>
	                <td>
	                    <label for="nit">NIT</label>
	                    <input type="text" id="nit" name="Nit"/>
	                </td>
	                <td>
	                <label for="phone">Teléfono</label>
	                <input type="text" id="phone" name="telefono_proveedor"/>
	            </td>
	            </tr>
	            <tr>
	                <td>
	                    <br>
	                    <label for="supplier">Nombre Proveedor</label>
	                    <input type="text" id="supplier" name="nombre_proveedor"/>
	                </td>
	                <td>
	                    <label for="city">Ciudad</label>
	                    <input type="text" id="city" name="ciudad_proveedor"/>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <br>
	                    <label for="address">Dirección</label>
	                    <input type="text" id="address" name="direccion_proveedor"/>
	                </td>
	            </tr>
	            <tr class="botones">
	                <td><input type="submit" name="boton" value="Consultar"/>
	                    <input type="submit" name="boton" value="Crear"/>
	                    <input type="submit" name="boton" value="Actualizar"/>
	                    <input type="submit" name="boton" value="Borrar"/>
	                </td>
	            </tr>
	           
	        </table> 
	     </form>
	 </div>
           
</body>
</html>