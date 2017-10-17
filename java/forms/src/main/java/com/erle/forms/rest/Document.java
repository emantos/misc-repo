package com.erle.forms.rest;

import java.text.Normalizer.Form;
import java.util.Collection;
import java.util.Collections;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/rest/doc")
public class Document {
	
	@RequestMapping(method = RequestMethod.GET)
	public Collection<Form> getForms() {
		return Collections.emptyList();
	}
}
