package com.coderman.changku;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages= {"com.coderman.changku.*.mapper"})
public class ChangkuApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChangkuApplication.class, args);
	}

}
