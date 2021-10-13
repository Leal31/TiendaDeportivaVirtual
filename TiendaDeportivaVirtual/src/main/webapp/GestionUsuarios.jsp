<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>
<%
	String nombre_usuario="";
	String email_usuario="";
	String usuario="";
	String password="";
	UsuariosController user =new UsuariosController();
    UsuarioVo userVo=new UsuarioVo();
    String opcion=request.getParameter("boton");
    try{
    if(opcion.equals("Consultar")){
        long cedula= Long.parseLong(request.getParameter("cedula_usuario"));
        userVo.setCedula_usuario(cedula);
    	userVo=user.consultarPersona(cedula);
    	nombre_usuario= userVo.getNombre_usuario();
    	email_usuario= userVo.getEmail_usuario();
    	usuario= userVo.getUsuario();
    	password= userVo.getContrasena();
    	if(userVo.getCedula_usuario()==0){
    		request.getRequestDispatcher("usuarios.jsp").forward(request, response);
    	}

    }
    else if(opcion.equals("Crear")){
        long cedula= Long.parseLong(request.getParameter("cedula_usuario"));
        userVo.setCedula_usuario(cedula);
        userVo.setNombre_usuario(request.getParameter("nombre_usuario"));
        userVo.setEmail_usuario(request.getParameter("email_usuario"));
        userVo.setUsuario(request.getParameter("usuario"));
        userVo.setContrasena(request.getParameter("contrasena"));
        user.registrarPersona(userVo);
    }
    else if(opcion.equals("Actualizar")){
    	long cedula= Long.parseLong(request.getParameter("cedula_usuario"));
        userVo.setCedula_usuario(cedula);
        userVo.setNombre_usuario(request.getParameter("nombre_usuario"));
        userVo.setEmail_usuario(request.getParameter("email_usuario"));
        userVo.setUsuario(request.getParameter("usuario"));
        userVo.setContrasena(request.getParameter("contrasena"));
        user.actualizarPersona(userVo);
    }
    else if(opcion.equals("Borrar")){
    	 	long cedula= Long.parseLong(request.getParameter("cedula_usuario"));
    	    userVo.setCedula_usuario(cedula);
    	    user.eliminarPersona(userVo.getCedula_usuario());
    	    request.getRequestDispatcher("usuarios.jsp").forward(request, response);
    }
    }catch (Exception e){
    	request.getRequestDispatcher("usuarios.jsp").forward(request, response);
    }
%>
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
                        <input type="text" id="document" name="cedula_usuario" value="<%=userVo.getCedula_usuario() %>"/>
                    </td>
                    <td>
                    <label for="user">Usuario</label>
                    <input type="text" id="user" name="usuario" value="<%= userVo.getUsuario() %>"/>
                </td>
                </tr>
                
                <tr class="elemento">
                    <td>
                        <br>
                        <label for="name">Nombre Completo</label>
                        <input type="text" id="name" name="nombre_usuario" value="<%=userVo.getNombre_usuario()  %>"/>
                    </td>
                    <td>
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="contrasena" value="<%= userVo.getContrasena() %>"/>
                </tr>
                <tr class="elemento">
                    <td>
                        <br>
                        <label for="mail">Correo Electrónico</label>
                        <input type="email" id="mail" name="email_usuario" value="<%= userVo.getEmail_usuario() %>"/>
                    </td>
                </tr>
                <tr class="botones">
                    <td>
                    	<input type="submit" name="boton" value="Consultar"/>
                    	<input type="submit" name="boton"  value="Crear"/>
                    	<input type="submit" name="boton"value="Actualizar"/>
                    	<input type="submit" name="boton" value="Borrar"/>
                    	<input onclick="limpiar()" type="submit" value="Limpiar"></input>
                    	<script>
                    	function limpiar() {
                    	    document.getElementById("cedula_usuario").value = "";
                    	    document.getElementById("usuario").value = "";
                    	    document.getElementById("nombre_usuario").value = "";
                    	    document.getElementById("contrasena").value = "";
                    	    document.getElementById("email_usuario").value = "";
                    	}</script>
                    	
                    </td>
                </tr>
            </table> 
       </form> 
    </div>
</body>
</html>
