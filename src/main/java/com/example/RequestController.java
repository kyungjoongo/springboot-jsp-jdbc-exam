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
		model.addAttribute("name", "고경준천재님이십니다sdlfksldkflsdklfksdlfklsdkflsdkflk");
		
		
		return "hello";
	}

	@RequestMapping("/kyungjoon22")
	public String kyungjoon22(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		
		
		model.addAttribute("name", "kyungjoonn_go");
		return "kyungjoon";
	}
}
