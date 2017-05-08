package com.sample.controller;

import com.sample.dao.BlogDao;
import com.sample.model.Greeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicLong;

@Controller
public class SampleController {

	private static final String template = "Hello, %s!";
	private final AtomicLong counter = new AtomicLong();

	@Autowired
	private BlogDao blogDao;

	@RequestMapping("/kyungjoon22")
	public String kyungjoon22(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		model.addAttribute("name", "test~~~~~~~~");
		return "sample";
	}

	@RequestMapping("/hello")
	public String hello(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {

		model.addAttribute("foo", "test98989898989898");
		model.addAttribute("sample", "고경준은 genius");
		blogDao.insertNewContent("고경준은 genius the genius33333");
		return "hello";

	}

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

		vmap.put("sample", "1114");
		vmap.put("kyungjoon2", "11142");
		vmap.put("kyungjoon3", "1114333");

		// id, contents
		return vmap;
	}

}