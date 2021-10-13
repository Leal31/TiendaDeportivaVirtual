<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>
<%
	String nombrepro="";
	String direccion="";
	String telefono="";
	String ciudad="";
	ProveedoresController proveedor =new ProveedoresController();
    ProveedorVo proveedorVo=new ProveedorVo();
    String opcion=request.getParameter("boton");
    try{
    if(opcion.equals("Consultar")){
    	long nit= Long.parseLong(request.getParameter("Nit"));
        proveedorVo.setNit(nit);
    	proveedorVo=proveedor.consultarProveedor(nit);
    	nombrepro= proveedorVo.getNombre_proveedor();
    	direccion= proveedorVo.getDireccion_proveedor();
    	telefono= proveedorVo.getTelefono_proveedor();
    	ciudad= proveedorVo.getCiudad_proveedor();
    	if(proveedorVo.getNit()==0){
    		request.getRequestDispatcher("proveedores.jsp").forward(request, response);
    	}

    }
    else if(opcion.equals("Crear")){
    	long nit= Long.parseLong(request.getParameter("Nit"));
    	proveedorVo.setNit(nit);
        proveedorVo.setNombre_proveedor(request.getParameter("nombre_proveedor"));
        proveedorVo.setDireccion_proveedor(request.getParameter("direccion_proveedor"));
        proveedorVo.setTelefono_proveedor(request.getParameter("telefono_proveedor"));
        proveedorVo.setCiudad_proveedor(request.getParameter("ciudad_proveedor"));
        proveedor.registrarProveedor(proveedorVo);
    }
    else if(opcion.equals("Actualizar")){
        long nit= Long.parseLong(request.getParameter("Nit"));
    	proveedorVo.setNit(nit);
   	    proveedorVo.setTelefono_proveedor(request.getParameter("telefono_proveedor"));
        proveedorVo.setNombre_proveedor(request.getParameter("nombre_proveedor"));
        proveedorVo.setCiudad_proveedor(request.getParameter("ciudad_proveedor"));
        proveedorVo.setDireccion_proveedor(request.getParameter("direccion_proveedor"));
        proveedor.actualizarProveedor(proveedorVo);
    }
    else if(opcion.equals("Borrar")){
    	long nit= Long.parseLong(request.getParameter("Nit"));
    	proveedorVo.setNit(nit);
    	proveedor.eliminarProveedor(proveedorVo.getNit());
    	request.getRequestDispatcher("proveedores.jsp").forward(request, response);
    }
    }catch (Exception e){
    	request.getRequestDispatcher("proveedores.jsp").forward(request, response);
    }
%>
<html>
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
	                    <input type="text" id="nit" name="Nit" value="<%= proveedorVo.getNit()%>"/>
	                </td>
	                <td>
	                <label for="phone">Teléfono</label>
	                <input type="text" id="phone" name="telefono_proveedor" value="<%=proveedorVo.getTelefono_proveedor()%>"/>
	            </td>
	            </tr>
	            <tr>
	                <td>
	                    <br>
	                    <label for="supplier">Nombre Proveedor</label>
	                    <input type="text" id="supplier" name="nombre_proveedor" value="<%=proveedorVo.getNombre_proveedor()%>"/>
	                </td>
	                <td>
	                    <label for="city">Ciudad</label>
	                    <input type="text" id="city" name="ciudad_proveedor" value="<%=proveedorVo.getCiudad_proveedor()%>"/>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <br>
	                    <label for="address">Dirección</label>
	                    <input type="text" id="address" name="direccion_proveedor" value="<%=proveedorVo.getDireccion_proveedor()%>" />
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
                    	    document.getElementById("Nit").value = "";
                    	    document.getElementById("telefono_proveedor").value = "";
                    	    document.getElementById("nombre_proveedor").value = "";
                    	    document.getElementById("ciudad_proveedor").value = "";
                    	    document.getElementById("direccion_proveedor").value = "";
                    	}</script>
	                </td>
	            </tr>
	           
	        </table> 
	     </form>
	 </div>
           
</body>
</html>