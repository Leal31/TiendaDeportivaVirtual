package com.DAO.TiendaDeportivaVirtual;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.DTO.TiendaDeportivaVirtual.ClienteVo;
// Inicio de clase tomando todo lo hecho con la conexion a la base de datos
public class ClienteDao extends Conexion {
	
	// Metodo Registrar Cliente
	public void registrarCliente(ClienteVo Cliente) {
		// Trycatch
		try {
			// Conectamos a la base de datos
			Conectar();
			// Creamos variable sentencia en la cual creamos el comando sql
			PreparedStatement sentencia = Conexion.prepareStatement("insert into clientes(cedula_cliente, nombre_cliente, direccion_cliente, telefono_cliente, email_cliente) values (?,?,?,?,?)");
			// Reemplazamos los ? con el valor real de la variable
			sentencia.setLong(1, Cliente.getCedula_cliente());
			sentencia.setString(2, Cliente.getNombre_cliente());
			sentencia.setString(3, Cliente.getDireccion_cliente());
			sentencia.setString(4, Cliente.getTelefono_cliente());
			sentencia.setString(5, Cliente.getEmail_cliente());
			// Ejecutamos la sentencia
			sentencia.executeUpdate();
			// Desconectamos de la base de datos
			Desconectar();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo Actualizar Cliente
	public void actualizarCliente(ClienteVo Cliente) {
		// Trycatch
		try {
			// Conectamos a la base de datos
			Conectar();
			// Creamos una sentencia para el comando sql
			PreparedStatement sentencia = Conexion.prepareStatement("update clientes set nombre_cliente = ?, direccion_cliente=?, telefono_cliente = ?, email_cliente = ? where cedula_cliente = ?");
			// Reemplazamos los ? con los verdaderos valores
			sentencia.setString(1, Cliente.getNombre_cliente());
			sentencia.setString(2, Cliente.getDireccion_cliente());
			sentencia.setString(3, Cliente.getTelefono_cliente());
			sentencia.setString(4, Cliente.getEmail_cliente());
			sentencia.setLong(5, Cliente.getCedula_cliente());
			// Ejecutamos la sentencia
			sentencia.executeUpdate();
			// Desconectamos a la base de datos
			Desconectar();
			
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo Eliminar Cliente
	public void eliminarCliente(Long cedula_cliente) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia con el codigo sql
			PreparedStatement sentencia = Conexion.prepareStatement("delete from clientes where cedula_cliente = ?");
			// Reemplazamos los ? por el verdadero valor
			sentencia.setLong(1, cedula_cliente);
			// Ejecutamos el comando
			sentencia.executeUpdate();
			// Nos desconectamos de la base de datos
			Desconectar();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo de retorno Consultar cliente
	public ClienteVo consultarCliente(Long cedula_cliente) {
		// Trycatch
		try {
			// Conectamos a la base de datos
			Conectar();
			// Creamos el comando sql
			PreparedStatement sentencia = Conexion.prepareStatement("select * from clientes where cedula_cliente = ?");
			// Reemplazamos los ? por el valor verdadero
			sentencia.setLong(1, cedula_cliente);
			// Ejecutamos la sentencia guardando en una variable los datos que retorne
			ResultSet datos = sentencia.executeQuery();
			// Condicional donde si la variable datos no esta vacia deberemos llenar el ClienteVo con los datos que retorne la variable datos
			if (datos.next()) {
				ClienteVo Cliente = new ClienteVo();
				Cliente.setCedula_cliente(datos.getLong("cedula_cliente"));
				Cliente.setNombre_cliente(datos.getString("nombre_cliente"));
				Cliente.setDireccion_cliente(datos.getString("direccion_cliente"));
				Cliente.setTelefono_cliente(datos.getString("telefono_cliente"));
				Cliente.setEmail_cliente(datos.getString("email_cliente"));
				// Nods desconectamos de la base de datos
				Desconectar();
				// Retornamos el clienteVo
				return Cliente;
			}else {
				// No hace nada y retornara null
				ClienteVo Cliente = new ClienteVo();
				Cliente.setCedula_cliente(0);
			}
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
	}
}