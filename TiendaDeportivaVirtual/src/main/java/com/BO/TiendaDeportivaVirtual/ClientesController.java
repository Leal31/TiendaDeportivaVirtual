package com.BO.TiendaDeportivaVirtual;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.DAO.TiendaDeportivaVirtual.ClienteDao;
import com.DTO.TiendaDeportivaVirtual.ClienteVo;

@RestController
public class ClientesController {
/*Registrar Clientes*/
	@RequestMapping("/registrarCliente")
	public void registrarCliente(ClienteVo Cliente){
		ClienteDao Dao=new ClienteDao();
		Dao.registrarCliente(Cliente);	
}

  @RequestMapping("/actualizarCliente")
	public void actualizarCliente(ClienteVo Cliente){
		ClienteDao Dao=new ClienteDao();
		Dao.actualizarCliente(Cliente);	
	}
	
	
	@RequestMapping("/eliminarCliente")
	public void eliminarCliente(Long cedula_cliente){
		ClienteDao Dao= new ClienteDao();
		Dao.eliminarCliente(cedula_cliente);
	}
	
	@RequestMapping("/consultarCliente")
	public ClienteVo consultarCliente(Long cedula_cliente){
		ClienteDao Dao= new ClienteDao();
		return Dao.consultarCliente(cedula_cliente);
	}
	
	
}

