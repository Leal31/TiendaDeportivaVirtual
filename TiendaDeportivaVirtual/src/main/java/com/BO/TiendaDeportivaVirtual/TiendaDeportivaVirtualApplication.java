package com.BO.TiendaDeportivaVirtual;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@SpringBootApplication
public class TiendaDeportivaVirtualApplication {

	public static void main(String[] args) {
		SpringApplication.run(TiendaDeportivaVirtualApplication.class, args);
	}
	@RequestMapping(method=RequestMethod.GET, value="/")
	public String main() {
		
		return "Login.html";
	}
	
}
