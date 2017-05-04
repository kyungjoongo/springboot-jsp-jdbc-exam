package com.kyungjoon.controller;

import com.kyungjoon.dao.BlogDao;
import com.kyungjoon.dao.ExampleDAO;

import net.minidev.json.JSONValue;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping("/webapp/grid")
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
