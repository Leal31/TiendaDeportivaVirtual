package com.DTO.TiendaDeportivaVirtual;
// Clase VentaVo
public class VentaVo {
    private long codigo_producto;
    private long cantidad_producto;
    private double valor_u;
    private double valor_total;
    private long codigo_venta;
    private long cedula_usuario;
    private long cedula_cliente;
    private double ivaVenta;
    private double total_venta;
    private double valor_venta;
    String DescripcionP;
    public VentaVo (){
    }

    public VentaVo(long codigo_producto, long cantidad_producto, double valor_u, double valor_total, long codigo_venta, long cedula_usuario, long cedula_cliente, double ivaVenta, double total_venta, double valor_venta, String DescripcionP) {
        this.codigo_producto = codigo_producto;
        this.cantidad_producto = cantidad_producto;
        this.valor_u = valor_u;
        this.valor_total = valor_total;
        this.codigo_venta = codigo_venta;
        this.cedula_usuario = cedula_usuario;
        this.cedula_cliente = cedula_cliente;
        this.ivaVenta = ivaVenta;
        this.total_venta = total_venta;
        this.valor_venta = valor_venta;
    }

    public long getCodigo_producto() {
        return codigo_producto;
    }

    public void setCodigo_producto(long codigo_producto) {
        this.codigo_producto = codigo_producto;
    }

    public long getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(long cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public double getValor_u() {
        return valor_u;
    }

    public void setValor_u(double valor_u) {
        this.valor_u = valor_u;
    }

    public double getValor_total() {
        return valor_total;
    }

    public void setValor_total(double valor_total) {
        this.valor_total = valor_total;
    }

    public long getCodigo_venta() {
        return codigo_venta;
    }

    public void setCodigo_venta(long codigo_venta) {
        this.codigo_venta = codigo_venta;
    }

    public long getCedula_usuario() {
        return cedula_usuario;
    }

    public void setCedula_usuario(long cedula_usuario) {
        this.cedula_usuario = cedula_usuario;
    }

    public long getCedula_cliente() {
        return cedula_cliente;
    }

    public void setCedula_cliente(long cedula_cliente) {
        this.cedula_cliente = cedula_cliente;
    }

    public double getIvaVenta() {
        return ivaVenta;
    }

    public void setIvaVenta(double ivaVenta) {
        this.ivaVenta = ivaVenta;
    }

    public double getTotal_venta() {
        return total_venta;
    }

    public void setTotal_venta(double total_venta) {
        this.total_venta = total_venta;
    }

    public double getValor_venta() {
        return valor_venta;
    }

    public void setValor_venta(double valor_venta) {
        this.valor_venta = valor_venta;
    }
    public String getDescripcionP() {
        return DescripcionP;
    }

    public void setDescripcionP(String DescripcionP) {
        this.DescripcionP = DescripcionP;
    }
}