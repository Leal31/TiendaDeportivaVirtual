package com.DAO.TiendaDeportivaVirtual;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.DTO.TiendaDeportivaVirtual.ProductoVo;

// Clase de producto que llamara los metodos de Conexion
public class ProductoDao extends Conexion {
	Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
	// Metodo recorrercsv
	public void recorrercsv(String archivo) {
		// Definimos variables a usar
		BufferedReader leer = null;
		String linea = "";
		String separar = ",";
		// Trycatch
		try {
			// Variable leer que llamara al archivo a usar
			leer = new BufferedReader(new FileReader(archivo));
			// Bucle donde se leera el archivo linea por linea
			while ((linea = leer.readLine()) != null) {
				// Los datos que se retorne se almacenaran en la variable datos separados por comas para diferenciar los datos
				String[] datos = linea.split(separar);
				// Instanciamos ProductoVo y cada dato va a ser un atributo de esta clase
				ProductoVo producto = new ProductoVo();
				producto.setNombre_producto(datos[0]);
				producto.setNitproveedor(Long.parseLong(datos[1]));
				producto.setPrecio_compra(Double.parseDouble(datos[2]));
				producto.setIvacompra(Double.parseDouble(datos[3]));
				producto.setPrecio_venta(Double.parseDouble(datos[4]));
				// Nos conectamos a la base de datos
				Conectar();
				// Primero tendremos que llamar a proveedores para verificar que los datos existan en la tabla la cual producto depende
				PreparedStatement consulta = Conexion.prepareStatement("select * from proveedores where Nit = ?");
				// Reemplazamos los ? por el valor verdadero
				consulta.setLong(1, producto.getNitproveedor());
				// Retornamos el resultado que salga
				ResultSet res = consulta.executeQuery();
				// SI no existe el proveedor en la tabla
				if (!res.isBeforeFirst() ) {
					System.out.println("no existe el nit " + producto.getNitproveedor());
					
				} else { // Si existe el proveedor
					PreparedStatement sentencia = Conexion.prepareStatement("insert into productos(nombre_producto, Nitproveedor, precio_compra, ivacompra, precio_venta) values (?,?,?,?,?)");
					sentencia.setString(1, producto.getNombre_producto());
					sentencia.setLong(2, producto.getNitproveedor());
					sentencia.setDouble(3, producto.getPrecio_compra());
					sentencia.setDouble(4, producto.getIvacompra());
					sentencia.setDouble(5, producto.getPrecio_venta());
					// Ejecutamos el comando
					sentencia.executeUpdate();
				}
			}
			// Nos desconectamos de la base de datos
			Desconectar();
			}catch(Exception e) {
				System.out.println(e);
			}
	}
	
	// Metodo examinarcsv
	public boolean examinarcsv(String dirarchivo) throws IOException {
		// Trycatch
		try {
		// Nos traemos el archivo a examinar
		File archivo = new File(dirarchivo);
		// Probamos la ruta del archivo
		String tipo = Files.probeContentType(archivo.toPath());
		// Si el tipo especifico es csv
		if (tipo == "application/vnd.ms-excel") {
			return true;
			
		} else { // si el tipo es diferente a csv
			return false;
		}
		} catch(Exception e) {
			return false;
		}
	}
	
	public ProductoVo listar (int cd) {		
		try {
			Conectar ();
			PreparedStatement sentencia = Conexion.prepareStatement("select * from productos where codigo_producto = ?");
			sentencia.setInt(1, cd);
			ResultSet datos = sentencia.executeQuery();
			if(datos.next()) {
				ProductoVo Producto=new ProductoVo();
				Producto.setcd(datos.getInt("codigo_producto"));
				Producto.setNombre_producto(datos.getString("nombre_producto"));
				Producto.setNitproveedor(datos.getLong("Nitproveedor"));
				Producto.setPrecio_compra(datos.getDouble("precio_compra"));
				Producto.setIvacompra(datos.getLong("iva"));
				Producto.setPrecio_venta(datos.getDouble("precio_venta"));
				Desconectar();
				return Producto;
			}
		} catch(Exception e) {
		}
		return null;
	}
}
