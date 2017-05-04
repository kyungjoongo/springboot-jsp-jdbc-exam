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
public class RequestController {

    @Autowired
    private BlogDao blogDao;


    @Autowired
    private ExampleDAO exampleDao;

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


  


    @RequestMapping("/webapp/loginForm")
    public String loginForm(Model model,
                            @RequestParam(value = "name", required = false, defaultValue = "World") String name) {
        model.addAttribute("name", "고경준천재지222~~~~~~~~");

        // sdlkfsdlkflsdklfkdslfklkdsf

        return "loginForm";
    }






    @RequestMapping("/webapp/loginAction")
    public String loginProcess(Model model,HttpServletRequest request,
                               @RequestParam(value = "id", required = false) String id
                            , @RequestParam(value = "password", required = false) String password

    ) {


        System.out.println("loginActionloginActionloginActionloginActionloginActionloginAction---->");
        HashMap userMap=new HashMap();

        userMap.put("id", id);
        userMap.put("password", password);

        boolean isExistUser = exampleDao.getUser(userMap);



        if ( isExistUser){
            System.out.println("유저가 존재하네");

            request.getSession().setAttribute("id", id);

            return "/webapp/grid";


        }else{
            System.out.println("유저가 존재하지 않는다..");

            model.addAttribute("message", "해당유저가 존재하지 않습니다.");
            return "/webapp/loginForm";
        }


    }


    @RequestMapping("/webapp/logoutAction")
    public String logoutAction(Model model,HttpServletRequest request,
                               @RequestParam(value = "name", required = false, defaultValue = "World") String name) {


        request.getSession().invalidate();

        return "/webapp/loginForm";
    }



}
