package com.kyungjoon.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kyungjoon.dao.BlogDao;
import com.kyungjoon.model.Greeting;

import net.minidev.json.JSONValue;

@Controller
public class RestController {

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

	@RequestMapping("getGridData")
	public @ResponseBody String getGridData(
			@RequestParam(value = "name", required = false, defaultValue = "Stranger") String name)
			throws JsonGenerationException, JsonMappingException, IOException {

		List arrList = blogDao.selecContents(null);

		Map<String, Object> map = new HashMap<String, Object>();
		/*map.put("page", page);
		map.put("total", total);
		map.put("records", records);*/
		map.put("rows", arrList);
		return JSONValue.toJSONString(map);

	}

	@RequestMapping("/grid")
	public String kyungjoon22(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {

		return "grid";
	}
	
	@RequestMapping("/getGraphData")
	public @ResponseBody String getGraphData()
			
			throws JsonGenerationException, JsonMappingException, IOException {

		List arrList = blogDao.getGraphData();

		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", arrList);*/
		return JSONValue.toJSONString(arrList);

	}

}