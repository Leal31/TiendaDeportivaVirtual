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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<table border="1">
   <div class="card">
                <div class="card-body">
                <table class="table table-hover ml-aout">
                        <thead class="table-dark">
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
						</div>
                        </div>
                    </table>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>