package com.DAO.TiendaDeportivaVirtual;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.DTO.TiendaDeportivaVirtual.ProveedorVo;


// Clase proveedor que llama la Conexion
public class ProveedoresDao extends Conexion{
	
	// Metodo registrarproveedor
	public void registrarProveedor(ProveedorVo Proveedor) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("insert into proveedores(Nit,nombre_proveedor,direccion_proveedor,telefono_proveedor,ciudad_proveedor) values (?,?,?,?,?)");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setLong(1, Proveedor.getNit());
			sentencia.setString(2, Proveedor.getNombre_proveedor());
			sentencia.setString(3, Proveedor.getDireccion_proveedor());
			sentencia.setString(4, Proveedor.getTelefono_proveedor());
			sentencia.setString(5, Proveedor.getCiudad_proveedor());
			// Ejecutamos el codigo
			sentencia.executeUpdate();
			// Nos desconectamos
			Desconectar();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo actualizar proveedor
	public void actualizarProveedor(ProveedorVo Proveedor) {
		// Trycatch
		try {
			// Conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("update proveedores set nombre_proveedor= ?,direccion_proveedor= ?, telefono_proveedor = ?, ciudad_proveedor = ? where Nit = ?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setString(1, Proveedor.getNombre_proveedor());
			sentencia.setString(2, Proveedor.getDireccion_proveedor());
			sentencia.setString(3, Proveedor.getTelefono_proveedor());
			sentencia.setString(4, Proveedor.getCiudad_proveedor());
			sentencia.setLong(5, Proveedor.getNit());
			// Ejecutamos la sentencia
			sentencia.executeUpdate();
			// Nos desconectamos de la base de datos
			Desconectar();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo eliminar proveedor
	public void eliminarProveedor(Long Nit) {	
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("delete from proveedores where Nit =?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setLong(1, Nit);
			// Ejecutamos la sentencia
			sentencia.executeUpdate();
			// Nos desconectamos de la base de datos
			Desconectar();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo consultar proveedor
	public ProveedorVo consultarProveedor(Long Nit) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("select * from proveedores where Nit = ?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setLong(1, Nit);
			// ejecutamos la sentencia guardando los datos en una variable llamada datos
			ResultSet datos = sentencia.executeQuery();
			// Condicional si tenemos la variable datos llena
			if (datos.next()) {
				// Instanciamos ProveedorVo para llenarlo con los datos retornando
				ProveedorVo Proveedor = new ProveedorVo();
				Proveedor.setNit(datos.getLong("Nit"));
				Proveedor.setNombre_proveedor(datos.getString("nombre_proveedor"));
				Proveedor.setDireccion_proveedor(datos.getString("direccion_proveedor"));
				Proveedor.setTelefono_proveedor(datos.getString("telefono_proveedor"));
				Proveedor.setCiudad_proveedor(datos.getString("ciudad_proveedor"));
				// Nos desconectamos de la base de datos
				Desconectar();
				// Retornamos la variable 
				return Proveedor;
			}else {
				// No retorna nada
				ProveedorVo Proveedor = new ProveedorVo();
				Proveedor.setNit(0);
			}
			
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
	}
}