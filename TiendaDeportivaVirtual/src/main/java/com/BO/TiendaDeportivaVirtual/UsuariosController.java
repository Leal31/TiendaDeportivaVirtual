package com.BO.TiendaDeportivaVirtual;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.DAO.TiendaDeportivaVirtual.UsuarioDao;
import com.DTO.TiendaDeportivaVirtual.UsuarioVo;



@RestController
public class UsuariosController {
	/*Registrar Usuarios*/
	@RequestMapping("/registrarUsuario")
	public void registrarPersona(UsuarioVo Usuario){
		UsuarioDao Dao=new UsuarioDao();
		Dao.registrarPersona(Usuario);	
	}
	
	
	@RequestMapping("/actualizarUsuario")
	public void actualizarPersona(UsuarioVo Usuario){
		UsuarioDao Dao=new UsuarioDao();
		Dao.actualizarPersona(Usuario);	
	}
	
	
	@RequestMapping("/eliminarUsuario")
	public void eliminarPersona(Long cedula_usuario){
		UsuarioDao Dao= new UsuarioDao();
		Dao.eliminarPersona(cedula_usuario);
	}
	
	@RequestMapping("/consultarUsuario")
	public UsuarioVo consultarPersona(Long cedula_usuario){
		UsuarioDao Dao= new UsuarioDao();
		return Dao.consultarPersona(cedula_usuario);
	}
	
	@RequestMapping("/login")
	public boolean consulta(String usuario, String contrasena) {
		UsuarioDao Dao = new UsuarioDao();
		return Dao.consulta(usuario, contrasena);
		
	}
}
