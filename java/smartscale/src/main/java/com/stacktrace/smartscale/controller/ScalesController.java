package com.stacktrace.smartscale.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.stacktrace.smartscale.model.Scale;

@RestController
public class ScalesController {
	
	@RequestMapping(value = "/rest/scales", method = RequestMethod.GET)
	public Collection<Scale> getAllScales() {
		List<Scale> scales = new ArrayList<Scale>();
		for (int i = 0; i < 22; i++) {
			scales.add(Scale.newScale("Scale " + i, "org.stacktrace.smartscale:scale" + i, Math.random() * 5000, 5000.00));
		}
		return scales;
	}
	
}
