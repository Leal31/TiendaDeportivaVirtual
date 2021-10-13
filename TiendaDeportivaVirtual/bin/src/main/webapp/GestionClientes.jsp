<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,
        com.DTO.TiendaDeportivaVirtual.*"
%>
<%
	String nombre_cliente="";
	String direccion_cliente="";
	String telefono_cliente="";
	String email_cliente="";
	ClientesController cliente= new ClientesController();
	ClienteVo clienteVo= new ClienteVo();
    String opcion=request.getParameter("boton");
    try{
    if(opcion.equals("Consultar")){
    	long cedula_cli= Long.parseLong(request.getParameter("cedula_cliente"));
        clienteVo.setCedula_cliente(cedula_cli);
        clienteVo=cliente.consultarCliente(cedula_cli);
        nombre_cliente= clienteVo.getNombre_cliente();
        direccion_cliente= clienteVo.getDireccion_cliente();
        telefono_cliente= clienteVo.getTelefono_cliente();
        email_cliente= clienteVo.getEmail_cliente();
        if(clienteVo.getCedula_cliente()==0){
    		request.getRequestDispatcher("clientes.jsp").forward(request, response);
    	}
    }
    else if(opcion.equals("Crear")){
    	long cedula_cli= Long.parseLong(request.getParameter("cedula_cliente"));
        clienteVo.setCedula_cliente(cedula_cli);
        clienteVo.setNombre_cliente(request.getParameter("nombre_cliente"));
        clienteVo.setDireccion_cliente(request.getParameter("direccion_cliente"));
        clienteVo.setTelefono_cliente(request.getParameter("telefono_cliente"));
        clienteVo.setEmail_cliente(request.getParameter("email_cliente"));
        cliente.registrarCliente(clienteVo);
    }
    else if(opcion.equals("Actualizar")){
        long cedula_cli= Long.parseLong(request.getParameter("cedula_cliente"));
        clienteVo.setCedula_cliente(cedula_cli);
        clienteVo.setNombre_cliente(request.getParameter("nombre_cliente"));
        clienteVo.setDireccion_cliente(request.getParameter("direccion_cliente"));
        clienteVo.setTelefono_cliente(request.getParameter("telefono_cliente"));
        clienteVo.setEmail_cliente(request.getParameter("email_cliente"));
        cliente.actualizarCliente(clienteVo);
    }
    else if(opcion.equals("Borrar")){
        long cedula_cli= Long.parseLong(request.getParameter("cedula_cliente"));
        clienteVo.setCedula_cliente(cedula_cli);
        cliente.eliminarCliente(clienteVo.getCedula_cliente());
        request.getRequestDispatcher("clientes.jsp").forward(request, response);
    }
    }catch (Exception e){
    	request.getRequestDispatcher("clientes.jsp").forward(request, response);
    }
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
                        <input type="text" id="document" name="cedula_cliente" value="<%=clienteVo.getCedula_cliente()%>"/>
                    </td>
                    <td>
                        <label for="phone">Teléfono</label>
                        <input type="text" id="phone" name="telefono_cliente" value="<%=clienteVo.getTelefono_cliente()%>"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <label for="name">Nombre Completo</label>
                        <input type="text" id="name" name="nombre_cliente" value="<%=clienteVo.getNombre_cliente()%>"/>
                    </td>
                    <td>
                        <label for="mail">Correo Electrónico</label>
                        <input type="email" id="mail" name="email_cliente" value="<%=clienteVo.getEmail_cliente() %>"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <label for="address">Dirección</label>
                        <input type="text" id="address" name="direccion_cliente" value="<%=clienteVo.getDireccion_cliente()%>"/>
                    </td>
                </tr>
                <tr class="botones">
                    <td><input type="submit" name="boton" value="Consultar"/>
                        <input type="submit" name="boton" value="Crear"/>
                        <input type="submit" name="boton" value="Actualizar" />
                        <input type="submit" name="boton" value="Borrar"/>
                        <input onclick="limpiar()" type="submit" value="Limpiar"></input>
                    	<script>
                    	function limpiar() {
                    	    document.getElementById("cedula_cliente").value = "";
                    	    document.getElementById("telefono_cliente").value = "";
                    	    document.getElementById("nombre_cliente").value = "";
                    	    document.getElementById("email_cliente").value = "";
                    	    document.getElementById("direccion_cliente").value = "";
                    	}</script>
                    </td>
                </tr>
            </table>    
        </form>
    </div>
</body>
</html>