package com.DTO.TiendaDeportivaVirtual;

// Clase proveedorVo
public class ProveedorVo {
	// Atributos
	private long Nit;
	private String nombre_proveedor;
	private String direccion_proveedor;
	private String telefono_proveedor;
    private String ciudad_proveedor;
    
    // Constructor vacio
    public ProveedorVo(){}
    // Constructor
    public ProveedorVo(long Nit,String nombre_proveedor,String direccion_proveedor,String telefono_proveedor,String ciudad_proveedor){
        this.Nit=Nit;
        this.nombre_proveedor=nombre_proveedor;
        this.direccion_proveedor=direccion_proveedor;
        this.telefono_proveedor=telefono_proveedor;
        this.ciudad_proveedor=ciudad_proveedor;
       }
    // Getters y setters
	public long getNit() {
		return Nit;
	}
	public void setNit(long nit) {
		Nit = nit;
	}
	public String getNombre_proveedor() {
		return nombre_proveedor;
	}
	public void setNombre_proveedor(String nombre_proveedor) {
		this.nombre_proveedor = nombre_proveedor;
	}
	public String getDireccion_proveedor() {
		return direccion_proveedor;
	}
	public void setDireccion_proveedor(String direccion_proveedor) {
		this.direccion_proveedor = direccion_proveedor;
	}
	public String getTelefono_proveedor() {
		return telefono_proveedor;
	}
	public void setTelefono_proveedor(String telefono_proveedor) {
		this.telefono_proveedor = telefono_proveedor;
	}
	public String getCiudad_proveedor() {
		return ciudad_proveedor;
	}
	public void setCiudad_proveedor(String ciudad_proveedor) {
		this.ciudad_proveedor = ciudad_proveedor;
	}

}