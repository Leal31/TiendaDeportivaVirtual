package com.DAO.TiendaDeportivaVirtual;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.TiendaDeportivaVirtual.UsuarioDao;
import com.DTO.TiendaDeportivaVirtual.UsuarioVo;

// Clase Usuario
public class UsuarioDao extends Conexion {

	// Metodo Registrar usuario
	public void registrarPersona(UsuarioVo Usuario) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("Insert into usuarios(cedula_usuario, nombre_usuario, email_usuario, usuario, contrasena) values (?,?,?,?,?)");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setLong(1, Usuario.getCedula_usuario());
			sentencia.setString(2, Usuario.getNombre_usuario());
			sentencia.setString(3, Usuario.getEmail_usuario());
			sentencia.setString(4, Usuario.getUsuario());
			sentencia.setString(5, Usuario.getContrasena());
			// Ejecutamos la sentencia
			sentencia.executeUpdate();
			// Nos Desconectamos de la base de datos
			Desconectar();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// Metodo actualizar usuario
	public void actualizarPersona(UsuarioVo Usuario) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("Update usuarios set nombre_usuario = ?, email_usuario = ?, usuario = ? , contrasena= ? where cedula_usuario = ?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setString(1, Usuario.getNombre_usuario());
			sentencia.setString(2, Usuario.getEmail_usuario());
			sentencia.setString(3, Usuario.getUsuario());
			sentencia.setString(4, Usuario.getContrasena());
			sentencia.setLong(5, Usuario.getCedula_usuario());
			// Ejecutamos sentencia
			sentencia.executeUpdate();
			// Nos Desconectamos de la base de datos
			Desconectar();
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	// Metodo eliminar persona
	public void eliminarPersona(Long cedula_usuario) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("delete from usuarios where cedula_usuario = ?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setLong(1, cedula_usuario);
			// Ejecutamos sentencia
			sentencia.executeUpdate();
			// Nos desconectamos de la base de datos
			Desconectar();
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	
	// Metodo consultar persona
	public UsuarioVo consultarPersona(Long cedula_usuario) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("select * from usuarios where cedula_usuario= ?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setLong(1, cedula_usuario);
			// Ejecutamos la sentencia y guardamos lo que retorna en la variable datos
			ResultSet datos = sentencia.executeQuery();
			// condicional para ver si la variable fue llenada
			if (datos.next()) {
				// Instanciamos UsuarioVo y llenamos los atributos que retorne la variable datos
				UsuarioVo Usuario = new UsuarioVo();
				Usuario.setCedula_usuario(datos.getLong("cedula_usuario"));
				Usuario.setNombre_usuario(datos.getString("nombre_usuario"));
				Usuario.setEmail_usuario(datos.getString("email_usuario"));
				Usuario.setUsuario(datos.getString("usuario"));
				Usuario.setContrasena(datos.getString("contrasena"));
				// Nos desconectamos de la base de datos
				Desconectar();
				// Retornamos la instancia
				return Usuario;
			}else {
				// No retornamos nada
				UsuarioVo Usuario = new UsuarioVo();
				Usuario.setCedula_usuario(0);
			}
			
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
		
	}

	// Metodo consulta que sirve para iniciar sesion
	public boolean consulta(String usuario, String contrasena) {
		// Trycatch
		try {
			// Nos conectamos a la base de datos
			Conectar();
			// Sentencia sql
			PreparedStatement sentencia = Conexion.prepareStatement("select * from usuarios where usuario = ? and contrasena= ?");
			// Reemplazamos los ? por los valores verdaderos
			sentencia.setString(1, usuario);
			sentencia.setString(2, contrasena);
			// Guardamos en la variable datos lo que se nos retorne
			ResultSet datos = sentencia.executeQuery();
			// Condicional para ver si fue llenada con dos valores true o false
			if (datos.next()) {
				return true;
			}else {
				return false;
			}
		}
		catch (Exception e) {
			System.out.println(e);
	     }
		return false;
       }
	
}


