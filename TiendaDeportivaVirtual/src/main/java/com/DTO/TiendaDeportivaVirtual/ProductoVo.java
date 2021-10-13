package com.DTO.TiendaDeportivaVirtual;
// Clase productoVo
public class ProductoVo {
	// Atributos
    private double ivacompra;
    private long Nitproveedor;
    private String nombre_producto;
    private double precio_compra;
    private double precio_venta;
    private int cd;
    // Constructor vacio
    public ProductoVo(){}
    // Constructor
    public ProductoVo(long ivacompra,long Nitproveedor,String nombre_producto,double precio_compra,double precio_venta, String archivo){
        this.ivacompra=ivacompra;
        this.Nitproveedor=Nitproveedor;
        this.nombre_producto=nombre_producto;
        this.precio_compra=precio_compra;
        this.precio_venta=precio_venta;
        }

	// Getters y setters
	
	public double getIvacompra() {
		return ivacompra;
	}
	public void setIvacompra(double iva_compra) {
		this.ivacompra = iva_compra;
	}
	public long getNitproveedor() {
		return Nitproveedor;
	}
	public void setNitproveedor(long nitproveedor) {
		Nitproveedor = nitproveedor;
	}
	public String getNombre_producto() {
		return nombre_producto;
	}
	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}
	public double getPrecio_compra() {
		return precio_compra;
	}
	public void setPrecio_compra(double precio_compra) {
		this.precio_compra = precio_compra;
	}
	public double getPrecio_venta() {
		return precio_venta;
	}
	public void setPrecio_venta(double precio_venta) {
		this.precio_venta = precio_venta;
	}
	public int getcd() {
        return cd;
    }

    public void setcd(int cd) {
        this.cd = cd;
    }

   
}
