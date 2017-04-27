package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.dao.BlogDao;

@Controller
public class RequestController {

	@Autowired
	private BlogDao blogDao;

	@RequestMapping("/hello")
	public String hello(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {

		model.addAttribute("foo", "test98989898989898");
		model.addAttribute("kyungjoon", "고경준은 천재다");
		blogDao.insertNewContent("고경준은 genius the genius33333");
		return "hello";
	}

	@RequestMapping("/kyungjoon22")
	public String kyungjoon22(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		model.addAttribute("name", "고경준천재지~~~~~~~~");

		// sdlkfsdlkflsdklfkdslfklkdsf

		return "kyungjoon";
	}
}
