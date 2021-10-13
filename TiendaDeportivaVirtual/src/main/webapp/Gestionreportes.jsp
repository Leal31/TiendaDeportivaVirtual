<%String opcion=(request.getParameter("boton"));
if (opcion.equals("Listado de usuarios")){
	Long cc = Long.parseLong(request.getParameter("cedulacliente"));
	cliente.setCedula_cliente(cc);
	cliente=Cc.consultarCliente(cc);

}
else if(opcion.equals("Buscar Producto")){

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div class="col-sm-8">
            <div class="card">
                <div class="card-body">
                    <div class="col-sm-5 ml-aout">
                        <label>NumeroSerie</label>
                        <input type="text" name="NroSerie" value="${nserie}" class="form-control">
                    </div>
                    <div class="tablita">
                        <table class="table table-hover ml-aout">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>iva</th>
                                    <th>SubTotal</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${lista}">
                                <tr>
                                    <td><%=producto.getcd()%></td>
                                    <td><%=venta.getDescripcionP() %></td>
                                    <td><%=venta.getValor_u() %></td>
                                    <td><%=venta.getCantidad_producto() %></td>
                                    <td><%=venta.getIvaVenta() %></td>
                                    <td><%=venta.getTotal_venta() %></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                <div class="card-footer d-flex">
                    <div class="col-sm-6">
                        
                        <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                    </div>
                    <div class="col-sm-4 ml-aout">
                            <button type="submit" name="accion" value="Generar venta" class="btn btn-outline-info">Generar</button>
                        <input type="text" name="txtTotal" value="$ ${totalpagar}" class="form-control">
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.min.js" integrity="sha384-PsUw7Xwds7x08Ew3exXhqzbhuEYmA2xnwc8BuD6SEr+UmEHlX8/MCltYEodzWA4u" crossorigin="anonymous"></script>
</body>
</html>

</body>
</html>