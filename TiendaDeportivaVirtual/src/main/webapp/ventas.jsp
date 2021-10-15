<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link href="css/Estilos.css" type="text/css" rel="stylesheet"/>
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