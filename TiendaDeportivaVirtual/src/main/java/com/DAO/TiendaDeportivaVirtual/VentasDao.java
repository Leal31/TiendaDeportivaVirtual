package com.DAO.TiendaDeportivaVirtual;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DTO.TiendaDeportivaVirtual.UsuarioVo;
import com.DTO.TiendaDeportivaVirtual.VentaVo;

public class VentasDao extends Conexion {
	Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    

    public void guardarVenta(VentaVo ve){
        try {
        	Conectar();
        	PreparedStatement ventas = 
        			Conexion.prepareStatement("insert into ventas(cedula_usuario, cedula_cliente, ivaventa, total_venta, valor_venta)values(?,?,?,?,?)");
        	ventas.setLong(1, ve.getCedula_usuario());
            ventas.setLong(2, ve.getCedula_cliente());
            ventas.setDouble(3, ve.getIvaVenta());
            ventas.setDouble(4, ve.getTotal_venta());
            ventas.setDouble(5, ve.getValor_venta());
            System.out.println("paso");
            ventas.executeUpdate();
            System.out.println("paso");
        } catch (Exception e) {
        	System.out.println("Error"+e);
        }
        Desconectar();
        
    }
    public int guardarDetalleventas(VentaVo venta){
        try {
        	Conectar();
        	PreparedStatement ventas = Conexion.prepareStatement("insert into detalle_ventas(codigo_producto,cantidad_producto,valor_unitario,valor_total)values(?,?,?,?)");
            ventas.setLong(1, venta.getCedula_usuario());
            ventas.setLong(2, venta.getCedula_cliente());
            ventas.setDouble(3, venta.getIvaVenta());
            ventas.setDouble(4, venta.getTotal_venta());
            ventas.setDouble(5, venta.getValor_venta());
            ventas.executeUpdate();
        } catch (Exception e) {
        }
        Desconectar();
        return r;
    }
    public List <VentaVo>listar() {
		List <VentaVo> listav=new ArrayList<>();
		try {
			Conectar();
			PreparedStatement sentencia = Conexion.prepareStatement("select * from ventas ");
			ResultSet datos = sentencia.executeQuery();
			while(datos.next()) {
				VentaVo venta = new VentaVo();
				venta.setCodigo_venta(datos.getLong(1));
				venta.setCedula_usuario(datos.getLong(2));
				venta.setCedula_cliente(datos.getLong(3));
				venta.setIvaVenta(datos.getLong(4));
				venta.setTotal_venta(datos.getLong(5));
				venta.setValor_venta(datos.getLong(6));
				listav.add(venta);
			} 
	} catch(Exception e) {
	}return listav;
    
}
}