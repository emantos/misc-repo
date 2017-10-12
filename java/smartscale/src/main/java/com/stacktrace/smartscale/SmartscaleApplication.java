package com.stacktrace.smartscale;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SmartscaleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SmartscaleApplication.class, args);
	}
}
