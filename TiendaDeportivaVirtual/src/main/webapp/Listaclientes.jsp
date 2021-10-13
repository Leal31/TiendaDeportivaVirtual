<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
    import="
        java.io.*,
        java.util.*,
        com.DAO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>
<%
ClienteDao cliente=new ClienteDao();
ClienteVo clientev=new ClienteVo();
List<ClienteVo>lista=new ArrayList<>();
lista = cliente.listar();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clientes</title>
</head>
<body>
<table border="1">
                        <thead>
                            <tr>
                                <th>cedula_cliente</th>
                                <th>nombre_cliente</th>
                                <th>direccion_cliente</th>
                                <th>telefono_cliente</th>
                                <th>email_cliente</th>
                            </tr>
                        </thead>
                        <tbody>
                         <% for  ( ClienteVo listacli: lista){ %> 
                            <tr>
                                <td> <%= listacli.getCedula_cliente()%></td>
                                <td><%= listacli.getNombre_cliente()%></td>
                                <td><%= listacli.getDireccion_cliente()%></td>
                                <td><%= listacli.getTelefono_cliente()%></td>
                                <td><%= listacli.getEmail_cliente()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
</body>
</html>