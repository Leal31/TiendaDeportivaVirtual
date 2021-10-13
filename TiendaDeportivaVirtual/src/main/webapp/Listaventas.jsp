<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
    import="
        java.io.*,
        java.util.*,
        com.DAO.TiendaDeportivaVirtual.*,com.DTO.TiendaDeportivaVirtual.*"
%>
<%
VentasDao venta=new VentasDao();
VentaVo ventav=new VentaVo();
List<VentaVo>lista=new ArrayList<>();
lista = venta.listar();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventas</title>
</head>
<body>
<table border="1">
                        <thead>
                            <tr>
                                <th>codigo_venta</th>
                                <th>cedula_usuario</th>
                                <th>cedula_cliente</th>
                                <th>ivaventa</th>
                                <th>total_venta</th>
                                <th>valor_venta</th>
                            </tr>
                        </thead>
                        <tbody>
                         <% for  ( VentaVo listave: lista){ %> 
                            <tr>
                                <td> <%= listave.getCodigo_venta()%></td>
                                <td><%= listave.getCedula_usuario()%></td>
                                <td><%= listave.getCedula_cliente()%></td>
                                <td><%= listave.getIvaVenta()%></td>
                                <td><%= listave.getTotal_venta()%></td>
                                <td><%= listave.getValor_venta()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
</body>
</html>