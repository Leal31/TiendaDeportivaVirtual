
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Usuarios</title>
</head>
<body>
<table border="1">
 <div class="card">
                <div class="card-body">
                <table class="table table-hover ml-aout">
                        <thead class="table-dark">
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
						</div>
                        </div>
                    </table>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>