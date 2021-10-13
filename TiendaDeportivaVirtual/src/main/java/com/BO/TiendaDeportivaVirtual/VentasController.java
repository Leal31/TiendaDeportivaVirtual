package com.BO.TiendaDeportivaVirtual;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.DAO.TiendaDeportivaVirtual.VentasDao;
import com.DTO.TiendaDeportivaVirtual.VentaVo;

@RestController
public class VentasController {
	@RequestMapping("/guardarVenta")
	public void guardarVenta(VentaVo Venta) {
		VentasDao Dao = new VentasDao();
		Dao.guardarVenta(Venta);
	}
	
	@RequestMapping("guardarDetalleVenta")
	public void guardardetalleVenta(VentaVo venta) {
		VentasDao Dao = new VentasDao();
		Dao.guardarDetalleventas(venta);
	}
}
