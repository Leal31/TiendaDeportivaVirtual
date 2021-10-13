package com.DAO.TiendaDeportivaVirtual;
import java.sql.Connection;
import java.sql.DriverManager;

// Clase conexion
public class Conexion {
	// Creamos una variable llamada Conexion
    protected Connection Conexion;
    // Metodo Conectar
    protected void Conectar() {
    	// TryCatch
        try {
        	// Llamamos el driver de mysql
            Class.forName("com.mysql.cj.jdbc.Driver");
            // La variable Conexion traera este driver y va a llamar la base de datos por el url propio de mysql
            Conexion = DriverManager.getConnection("jdbc:mysql://tiendavirtualjh.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/tienda141?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8", "admin", "admin123");
            System.out.println("Conexión a base de datos OK\n"); // Aviso de conexion exitosa
        } catch (Exception e) {
        	// No se dara la conexion
            System.out.println("Error: " + e);
        }
        
    }
    // Metodo Desconectar
    protected void Desconectar() {
    	// Trycatch
        try {
        	// Cerramos la conexion
            Conexion.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
