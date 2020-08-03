package com.moa.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class MoaPrjApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(MoaPrjApplication.class, args);
		
		
	}

}
