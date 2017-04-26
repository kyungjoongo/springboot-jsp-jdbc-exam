package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RequestController {
	@RequestMapping("/hello")
	public String hello(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		model.addAttribute("name","고경준천재님-정말 천재님일까요???????개놈새끼들아");
		return "hello";
	}

	@RequestMapping("/kyungjoon22")
	public String kyungjoon22(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		model.addAttribute("name", "kyungjoonn_go");
		
		
		//sdlkfsdlkflsdklfkdslfklkdsf
		
		return "kyungjoon";
	}
}
