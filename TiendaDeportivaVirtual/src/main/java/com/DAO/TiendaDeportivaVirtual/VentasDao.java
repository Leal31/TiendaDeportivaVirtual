package com.DAO.TiendaDeportivaVirtual;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
}