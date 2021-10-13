<%@ page
    import="
        java.io.*,
        java.util.*,
        com.BO.TiendaDeportivaVirtual.*,
        com.DTO.TiendaDeportivaVirtual.*"
%>
<% 
VentaVo venta= new VentaVo();
VentasDao ventas= new VentasDao();
ClienteDao cdao= new ClienteDao();
if(menu.equals("NuevaVenta")){
    switch (accion){
        case "BuscarCliente":
            request.setAttribute("nserie", numeroserie);
            String dni=request.getParameter("cedula_cliente");
            c.setDni(dni);
            c= cdao.buscar(dni);
            request.setAttribute("c", c);
            break;
        case "BuscarProducto":
            request.setAttribute("nserie", numeroserie);
            int id=Integer.parseInt(request.getParameter("codigo_producto"));
            p=pdao.listar(id);
            request.setAttribute("c", c);
            request.setAttribute("producto", p);
            request.setAttribute("lista", lista);
            request.setAttribute("totalpagar", totalPagar);
            break;
        case "Agregar":
            request.setAttribute("nserie", numeroserie);
            request.setAttribute("c", c);
            totalPagar=0.0;
            item=item+1;
            cod=venta.getCodigo_producto();
            descripcion=request.getParameter("nombre_producto");
            precio= Double.parseDouble(request.getParameter("total_venta"));
            cant=Integer.parseInt(request.getParameter("cantidad_producto"));
            subtotal=precio*cant;
            v=new Venta();
            v.setItem(item);
            v.setIdproducto(cod);
            v.setDescripcionP(descripcion);
            v.setPrecio(precio);
            v.setCantidad(cant);
            v.setSubtotal(subtotal);
            lista.add(v);
            for (int i = 0; i<lista.size(); i++){
                totalPagar=totalPagar+lista.get(i).getSubtotal();
            }
            request.setAttribute("totalpagar", totalPagar);
            request.setAttribute("lista", lista);
            break;
        case "GenerarVenta":
           if(numeroserie==null){
                numeroserie="0000001";
                request.setAttribute("nserie", numeroserie);
            }
            else{
                int incrementar=Integer.parseInt(numeroserie);
                GenerarSerie gs = new GenerarSerie();
                numeroserie=gs.NumeroSerie(incrementar);
                request.setAttribute("nserie", numeroserie);
            }
    }
            for (int i=0; i < lista.size(); i++){
                Producto pr= new Producto();
                int cantidad= lista.get(i).getCantidad();
                int idproducto= lista.get(i).getIdproducto();
                ProductoDAO aO=new ProductoDAO(); 
                pr=aO.buscar(idproducto);
                int sac=pr.getStock()-cantidad;
                aO.actualizarstock(idproducto, sac);
            }
            v.setIdcliente(c.getId());
            v.setIdempleado(2);
            v.setNumserie(numeroserie);
            v.setFecha("2021-07-27");
            v.setMonto(totalPagar);
            v.setEstado("1");
            vdao.guardarVenta(v);
            int idv=Integer.parseInt(vdao.idVentas());
            for (int i=0; i < lista.size(); i++){
                v=new Venta();
                v.setId(idv);
                v.setIdproducto(lista.get(i).getIdproducto());
                v.setCantidad(lista.get(i).getCantidad());
                v.setMonto(lista.get(i).getMonto());
                vdao.guardarDetalleventas(v);
            }
            break;
         default:
            numeroserie=vdao.GenerarSerie();
            if(numeroserie==null){
                numeroserie="0000001";
                request.setAttribute("nserie", numeroserie);
            }
            else{
                int incrementar=Integer.parseInt(numeroserie);
                GenerarSerie gs = new GenerarSerie();
                numeroserie=gs.NumeroSerie(incrementar);
                request.setAttribute("nserie", numeroserie);
            }
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
    request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
    
  }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    <link href="estilos/estilos.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap" rel="stylesheet">
    <title>VENTAS</title>
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
                            <input type="text" name="codigocliente" value="${c.getDni()}" class="form-control" placeholder="Codigo">
                        </div>
                        <div class="botonesuno">
                            <input type="submit" name="accion" value="Buscar" class="botones">
                        </div>
                            <div class="col-sm-12">
                                <input type="text" name="nombrescliente" value="${c.getNom()}" placeholder="Datos Cliente" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Datos Producto</label>
                        </div>
                        <div>
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigoproducto" value="${producto.getId()}" class="form-control" placeholder="Codigo">
                            </div>
                            <div class="botonesuno">
                                <input type="submit" name="accion" value="Buscar">
                            </div>
                            <div class="col-sm-6">
                                <input type="text" name="nomproducto" value="${producto.getNom()}" placeholder="Datos Producto" class="form-control">
                            </div>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="precio" value="${producto.getPrecio()}" class="form-control" placeholder="$0.0">
                            </div>
                            <div class="col-sm-2">
                                <input type="number" value="1" name="cant" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="botonesuno">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-outline-info">
                        </div>
                    </div>
                </form>
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
                                    <th>Nro</th>
                                    <th>Codigo</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>SubTotal</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${lista}">
                                <tr>
                                    <td>${list.getItem()}</td>
                                    <td>${list.getId()}</td>
                                    <td>${list.getDescripcionP()}</td>
                                    <td>${list.getPrecio()}</td>
                                    <td>${list.getCantidad()}</td>
                                    <td>${list.getSubtotal()}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                <div class="card-footer d-flex">
                    <div class="col-sm-6">
                        <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">Generar Venta</a>
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