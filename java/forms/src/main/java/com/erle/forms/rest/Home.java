package com.erle.forms.rest;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/rest")
public class Home {
	
	@RequestMapping(value ={ "/context" }, method = RequestMethod.GET)
	public Map<String, Object> globalContext() {
		Map<String, Object> context = new LinkedHashMap<>();
		
		context.put("fbEnabled", true);
		context.put("twitterEnabled", true);
		
		return context;
	}
}
