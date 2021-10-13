<%@ page
    import="
        java.io.*,
        javax.swing.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>

<%
	UsuariosController user =new UsuariosController();
    UsuarioVo userVo=new UsuarioVo();
    userVo.setUsuario(request.getParameter("usuario"));
    userVo.setContrasena(request.getParameter("contrasena"));
    boolean respuesta= user.consulta(userVo.getUsuario(), userVo.getContrasena());
%>

<% if(respuesta != false){
			String site = "./Inicio.html" ;
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
			}else{
				String site = "./Login.html" ;
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}
%>
