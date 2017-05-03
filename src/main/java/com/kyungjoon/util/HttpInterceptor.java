package com.kyungjoon.util;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Component
public class HttpInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { // HTTP 요청 처리 전 수행할 로직 작성


        System.out.println("인터셋트 pre!!!!");

        HttpSession session = request.getSession();
        String sessionedId = (String)session.getAttribute("id");
        System.out.println("Pre-handle ::"+request.getRequestURI());

        String uri = request.getRequestURI();

        //인터셉트의 결리이 않고 진행.
        if ( uri.equals("/webapp/loginForm")){
            return true;
        }else if ( uri.equals("/webapp/loginAction")){
            return true;
        }
        //세션 id체크 로직.
        else if(sessionedId!=null){
            /*For Checking the Session
             * -----Start-----*/
            /**
             * 세션 체크후 id,paswrodd를 session 생성
             */
            return true;
        }else{
            response.sendRedirect("/webapp/loginForm");//Here Login is action Name which is Mapped in Login Controller
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {


        System.out.println("인터셋트 post!!!!");
    }
}


