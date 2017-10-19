package com.erle.forms.rest;

import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.file.Files;
import java.util.Collection;

import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.erle.forms.rest.model.Form;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@RestController
@RequestMapping(value = "/rest/doc")
public class Document {
	
	private Gson gson = new Gson();
	private Collection<Form> forms = getFormsFromResource();
	
	@RequestMapping(method = RequestMethod.GET)
	public Collection<Form> getForms() {
		return forms;
	}

	private Collection<Form> getFormsFromResource() {
		try {
			String formJson = new String(Files.readAllBytes(new ClassPathResource("pagibig.json").getFile().toPath()));
			
			Type collectionType = new TypeToken<Collection<Form>>(){}.getType();
			
			return gson.fromJson(formJson, collectionType);
		} catch (IOException e) {
			throw new RuntimeException("Can't load forms json", e);
		}
	}
}
