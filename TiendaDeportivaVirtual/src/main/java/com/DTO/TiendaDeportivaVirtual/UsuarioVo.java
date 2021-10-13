package com.DTO.TiendaDeportivaVirtual;
// Clase UsuarioVo
public class UsuarioVo {
	// Atributos
	private long cedula_usuario;
    private String nombre_usuario;
    private String email_usuario;
    private String usuario;
    private String contrasena;
    
    // Constructor vacio
    public UsuarioVo(){}
    // Constructor
    public UsuarioVo(long cedula_usuario, String nombre_usuario, String email_usuario,String contrasena,String usuario){
        this.cedula_usuario=cedula_usuario;
        this.nombre_usuario=nombre_usuario;
        this.email_usuario=email_usuario;
        this.usuario=usuario;
        this.contrasena=contrasena;      
        }
    // Getters y setters
	public long getCedula_usuario() {
		return cedula_usuario;
	}
	public void setCedula_usuario(long cedula_usuario) {
		this.cedula_usuario = cedula_usuario;
	}
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	public String getEmail_usuario() {
		return email_usuario;
	}
	public void setEmail_usuario(String email_usuario) {
		this.email_usuario = email_usuario;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

    
}