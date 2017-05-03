package com.kyungjoon.util;

import com.kyungjoon.model.Account;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor implements HandlerInterceptor {

	private boolean isResourceHandler(Object handler) {
		return handler instanceof ResourceHttpRequestHandler;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		ModelAndView mav=new ModelAndView();
		
		
		//리소스가 아닌 경우에만...
		if (!isResourceHandler(handler)) {
			doPostHandle(request, response, handler, mav);
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	public void doPostHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
				// TODO Auto-generated method stub
				HandlerMethod method = (HandlerMethod) handler;

				System.out.println("fdlkglfdkgldfkg");

				// 세션체크
				HttpSession session = request.getSession();
				// 로그인시 Account 객체가 세션에 담겨있습니다.
				Account accountId = (Account) session.getAttribute("id");
				// 로그인 체크 & 레벨 체크
				if (accountId != null) {
					System.out.println("로그인 되어있습니다");
				} else {
					System.out.println("로그인 안되있어!!");
				}


	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}