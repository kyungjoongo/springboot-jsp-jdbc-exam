package com.tinkerbell.controller;

import ch.qos.logback.classic.Logger;
import com.tinkerbell.dao.TinkerbellDao;
import com.tinkerbell.util.ApachePOIExcelRead;
import net.minidev.json.JSONValue;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tinkerbell")
public class TinkerbellController {

    private static final Logger logger = (Logger) LoggerFactory.getLogger(TinkerbellController.class);

    @Autowired
    private TinkerbellDao tinkerbellDao;


    @RequestMapping("/list")
    public String grid(Model model,
                       @RequestParam(value = "name", required = false, defaultValue = "World") String name) {

        return "/tinkerbell/list";
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/getDataList")
    public @ResponseBody
    String getGridData2(
            @RequestParam(value = "name", required = false, defaultValue = "Stranger") String name
            , @RequestParam(value = "page", required = false) int page
            , @RequestParam(value = "rows", required = false) int rows
            , @RequestParam(value = "sidx", required = false) String sidx//SortColumn
            , @RequestParam(value = "sord", required = false) String sord//SortOrder

    )
            throws JsonGenerationException, JsonMappingException, IOException {


        List<HashMap> arrList = tinkerbellDao.getDataList();


        HashMap map = new HashMap();
        map.put("rows", arrList);

        return JSONValue.toJSONString(map);

    }


    /**
     * @param file
     * @param redirectAttributes
     * @return
     */
    @PostMapping("/upload") // //new annotation since 4.3
    public ModelAndView upload(@RequestParam("file") MultipartFile file,
                               RedirectAttributes redirectAttributes) {


        List excelDataList = ApachePOIExcelRead.readExcelFile(file);

        tinkerbellDao.insertDataList(excelDataList);

        ModelAndView mav=new ModelAndView();

        mav.addObject("message", "업로드성공!");
        mav.setViewName("redirect:" + "/tinkerbell/list");


       // return "/tinkerbell/list";

        return mav;
    }


    @PostMapping("/delete")
    public @ResponseBody
    String delete(@RequestParam(value = "rowIds", required = false) String rowIds, Model model

    ) {

        String[] arrId = rowIds.split(",");


        System.out.println("idds-->" + arrId.toString());
        int result = tinkerbellDao.deleteDataList(arrId);


        if (result > 0) {
            model.addAttribute("message", "삭제성공");
        } else {
            model.addAttribute("message", "삭제실패");
        }


        List<HashMap> arrList = tinkerbellDao.getDataList();


        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", arrList);

        return JSONValue.toJSONString(map);
    }


    @PostMapping("/update")
    public @ResponseBody
    String update(@RequestParam(value = "rowid", required = false) String rowid,
                  @RequestParam(value = "query", required = false) String query,
                  @RequestParam(value = "query_answer", required = false) String query_answer,
                  Model model

    ) {


        Map<String, Object> map = new HashMap<String, Object>();


        int result = tinkerbellDao.updateData(query,query_answer,rowid);


        if (result > 0) {
            model.addAttribute("message", "수정성공");
        } else {
            model.addAttribute("message", "수정실패");
        }


        map.put("result", result);

        return JSONValue.toJSONString(map);
    }




	/*@RequestMapping("/getGridData2")
    public @ResponseBody String getGridData(
			@RequestParam(value = "name", required = false, defaultValue = "Stranger") String name)
			throws JsonGenerationException, JsonMappingException, IOException {

		List arrList = blogDao.selecContents(null);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", 1);

		//totalPage
		map.put("total", 5);
		map.put("records", 200);
		map.put("rows", arrList);
		return JSONValue.toJSONString(map);

	}
*/


}
