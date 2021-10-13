<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,
        com.DTO.TiendaDeportivaVirtual.*"
%>
<% 
VentasController Vc = new VentasController();
ClientesController Cc = new ClientesController ();
ProductoController Pc= new ProductoController ();
UsuariosController Ec=new UsuariosController();
UsuarioVo user  = new UsuarioVo();
ClienteVo cliente = new ClienteVo();
VentaVo venta= new VentaVo();
ProductoVo producto = new ProductoVo();
List<VentaVo>lista=new ArrayList<>();
String opcion=(request.getParameter("accion"));
if (opcion.equals("Buscar Cliente")) {
		Long cc = Long.parseLong(request.getParameter("cedulacliente"));
		cliente.setCedula_cliente(cc);
		cliente=Cc.consultarCliente(cc);
		request.setAttribute("cliente", cliente);
		
	
		}
else if(opcion.equals("Buscar Producto")){
		int cd=Integer.parseInt(request.getParameter("codigoproducto"));
		
		producto=Pc.listar(cd);
		
}
else if(opcion.equals("Agregar")){
	double totalPagar;
	int codigo;
	double precio;
	int cantidad;
	double subtotal;
	double totalcon;
	totalcon=0.0;
	String descripcion;
	totalPagar=0.0;
	int iva=19;
	codigo=producto.getcd();
	descripcion=request.getParameter("nomproducto");
	precio=Double.parseDouble(request.getParameter("precio"));
	cantidad = Integer.parseInt(request.getParameter("cant"));
	subtotal=precio*cantidad;
	totalcon=1;
	venta= new VentaVo();
	venta.setCodigo_producto(codigo);
	venta.setDescripcionP(descripcion);
	venta.setValor_u(precio);
	venta.setCantidad_producto(cantidad);
	venta.setTotal_venta(subtotal);
	venta.setValor_total(totalcon);
	venta.setIvaVenta(iva);
	lista.add(venta);
	for (int i = 0; i<lista.size(); i++){
		totalPagar=(totalPagar+lista.get(i).getTotal_venta()*0.19)+totalPagar+lista.get(i).getTotal_venta();
    }
	request.setAttribute("Buscar", producto);
	request.setAttribute("cliente", cliente);
	request.setAttribute("totalpagar", totalPagar);
    request.setAttribute("lista", lista);
	
}
else if(opcion.equals("GenerarVenta")){
	double totalPagar;
	int codigo;
	double precio;
	int cantidad;
	double subtotal;
	double totalcon;
	totalcon=0.0;
	String descripcion;
	totalPagar=0.0;
	int iva=19;
	codigo=producto.getcd();
	descripcion=request.getParameter("nomproducto");
	precio=Double.parseDouble(request.getParameter("precio"));
	cantidad = Integer.parseInt(request.getParameter("cant"));
	subtotal=precio*cantidad;
	totalcon=(subtotal*0.19)+subtotal;
	venta= new VentaVo();
	venta.setCodigo_producto(codigo);
	venta.setDescripcionP(descripcion);
	venta.setValor_u(precio);
	venta.setCantidad_producto(cantidad);
	venta.setTotal_venta(subtotal);
	venta.setValor_total(totalcon);
	venta.setIvaVenta(iva);
	venta.setCedula_usuario(user.getCedula_usuario());
	venta.setCedula_cliente(cliente.getCedula_cliente());
	venta.setIvaVenta(venta.getIvaVenta());
	venta.setTotal_venta(venta.getTotal_venta());
	venta.setValor_total(venta.getValor_venta());
	Vc.guardarVenta(venta);
	
	
}
    
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    <link href="css/Estilos.css" type="text/css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap" rel="stylesheet">
    <title>VENTAS</title>
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
    <div class="d-flex">
        <div class="col-sm-4 parte01">
            <div class="card">
                <form action="GestionVentas.jsp" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Datos del cliente</label>
                        </div>
                        <div>
                            <input type="text" name="cedulacliente" value="${cliente.getCedula_cliente()}" class="form-control" placeholder="Codigo">
                        </div>
                        <div class="botonesuno">
                            <input type="submit" name="accion" value="Buscar Cliente" class="btn btn-warning">
                        </div>
                            <div class="col-sm-12">
                                <input type="text" name="nombrescliente" value="<%=cliente.getNombre_cliente() %>" placeholder="Datos Cliente" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Datos Producto</label>
                        </div>
                        <div>
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigoproducto" value="<%=producto.getcd() %>" class="form-control" placeholder="Codigo">
                            </div>
                            <div class="botonesuno">
                                <input type="submit" name="accion" value="Buscar Producto" class="btn btn-warning">
                            </div>
                            <div class="col-sm-6">
                                <input type="text" name="nomproducto" value="<%=producto.getNombre_producto() %>" placeholder="Datos Producto" class="form-control">
                            </div>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="precio" value="<%= producto.getPrecio_compra() %>" class="form-control" placeholder="$0.0">
                            </div>
                            <div class="col-sm-2">
                                <input type="number" value="1" name="cant" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="botonesuno">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-warning"">
                            <input type="submit" name="accion" value="GenerarVenta" class="btn btn-warning"">
                        </div>
                        </form>
                    </div>
            </div>
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
                        <a href="GestionVentas?opcion=GenerarVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">Generar Venta</a>
                        <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                    </div>
                    <div class="col-sm-4 ml-aout">
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