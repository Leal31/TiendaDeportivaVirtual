
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
    import="
        java.io.*,
        java.util.*,
        com.DAO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>
<%
UsuarioDao usuario= new UsuarioDao();
UsuarioVo usuariov = new UsuarioVo();
List <UsuarioVo>lista= new ArrayList <>();
request.setAttribute("usuarios", lista);
lista = usuario.listar();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios</title>
</head>
<body>
<table border="1">
                        <thead>
                            <tr>
                                <th>cedula_usuario</th>
                                <th>nombre_usuario</th>
                                <th>email_usuario</th>
                                <th>usuario</th>
                                <th>contrasena</th>
                            </tr>
                        </thead>
                        <tbody>
                         <% for  ( UsuarioVo listausu: lista){ %> 
                            <tr>
                                <td> <%= listausu.getCedula_usuario()%></td>
                                <td><%= listausu.getNombre_usuario()%></td>
                                <td><%= listausu.getEmail_usuario()%></td>
                                <td><%= listausu.getUsuario()%></td>
                                <td><%= listausu.getContrasena()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
</body>
</html>