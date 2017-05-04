package com.kyungjoon.controller;

import com.kyungjoon.dao.BlogDao;
import com.kyungjoon.dao.ExampleDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class GridController {

    @Autowired
    private BlogDao blogDao;


    @Autowired
    private ExampleDAO exampleDao;

    @RequestMapping("/graph")
    public String graph(Model model,
                        @RequestParam(value = "name", required = false, defaultValue = "World") String name) {
        model.addAttribute("name", "고경준천재지~~~~~~~~");

        // sdlkfsdlkflsdklfkdslfklkdsf

        return "graph";
    }


    @RequestMapping("/pieGraph")
    public String pieGraph(Model model,
                           @RequestParam(value = "name", required = false, defaultValue = "World") String name) {
        model.addAttribute("name", "고경준천재지222~~~~~~~~");

        // sdlkfsdlkflsdklfkdslfklkdsf

        return "pieGraph";
    }


}
