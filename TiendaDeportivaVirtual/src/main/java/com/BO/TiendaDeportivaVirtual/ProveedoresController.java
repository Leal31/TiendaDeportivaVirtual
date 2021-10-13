package com.BO.TiendaDeportivaVirtual;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.DAO.TiendaDeportivaVirtual.ProveedoresDao;
import com.DTO.TiendaDeportivaVirtual.ProveedorVo;

@RestController
public class ProveedoresController {
	/*Registrar Usuarios*/
	@RequestMapping("/registrarProveedor")
	public void registrarProveedor(ProveedorVo Proveedor){
		ProveedoresDao Dao =new ProveedoresDao();
		Dao.registrarProveedor(Proveedor);
	}
	
	
	@RequestMapping("/actualizarProveedor")
	public void actualizarProveedor(ProveedorVo Proveedor){
		ProveedoresDao Dao =new ProveedoresDao();
		Dao.actualizarProveedor(Proveedor);
	}
	
	
	@RequestMapping("/eliminarProveedor")
	public void eliminarProveedor(Long Nit){
		ProveedoresDao Dao =new ProveedoresDao();
		Dao.eliminarProveedor(Nit);
	}
	
	@RequestMapping("/consultarProveedor")
	public ProveedorVo consultarProveedor(Long Nit){
		System.out.println("proveedorController/consultarProveedor");
		ProveedoresDao Dao =new ProveedoresDao();
		return Dao.consultarProveedor(Nit);
	}
}
