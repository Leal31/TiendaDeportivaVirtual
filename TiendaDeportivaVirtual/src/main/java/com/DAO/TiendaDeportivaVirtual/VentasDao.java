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
        String sql ="insert into ventas(cedula_usuario, cedula_cliente, Ivaventa, Total_venta,Valor_venta)values(?,?,?,?,?)";
        try {
            con=cn.Conexion;
            ps=con.prepareStatement(sql);
            ps.setLong(1, ve.getCedula_usuario());
            ps.setLong(2, ve.getCedula_cliente());
            ps.setDouble(3, ve.getIvaVenta());
            ps.setDouble(4, ve.getTotal_venta());
            ps.setDouble(5, ve.getValor_venta());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    public int guardarDetalleventas(VentaVo venta){
        String sql="insert into detalle_ventas(codigo_producto,cantidad_producto,valor_unitario,valor_total)values(?,?,?,?)";
        try {
            con=cn.Conexion;
            ps=con.prepareStatement(sql);
            ps.setLong(1, venta.getCodigo_producto());
            ps.setLong(2, venta.getCantidad_producto());
            ps.setDouble(3, venta.getValor_u());
            ps.setDouble(4, venta.getValor_total());
            ps.executeUpdate();
        } catch (Exception e) {
        }
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