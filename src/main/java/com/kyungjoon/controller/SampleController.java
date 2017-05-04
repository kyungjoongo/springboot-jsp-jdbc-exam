package com.kyungjoon.controller;

import com.kyungjoon.dao.BlogDao;
import com.kyungjoon.model.Greeting;
import net.minidev.json.JSONValue;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

@Controller
public class SampleController {

	private static final String template = "Hello, %s!";
	private final AtomicLong counter = new AtomicLong();

	@Autowired
	private BlogDao blogDao;

	@RequestMapping("/hello-world")
	public @ResponseBody Greeting sayHello(
			@RequestParam(value = "name", required = false, defaultValue = "Stranger") String name) {

		Greeting greeting = new Greeting(counter.incrementAndGet(), String.format(template, name));
		// id, contents
		return greeting;
	}

	@RequestMapping("resposeTest001")
	public @ResponseBody HashMap<String, String> resposeTest001(
			@RequestParam(value = "name", required = false, defaultValue = "Stranger") String name) {

		HashMap<String, String> vmap = new HashMap<String, String>();

		vmap.put("kyungjoon", "1114");
		vmap.put("kyungjoon2", "11142");
		vmap.put("kyungjoon3", "1114333");

		// id, contents
		return vmap;
	}

	

}