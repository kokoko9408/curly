package org.zerock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	//이전 로그인 작업 중 세션이 완전하게 지워지지 않아져서 발생할 수 있는 에러를 방지하기 위해 
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
		 
		 System.out.println("LoginInterceptor preHandle 작동");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	 
		 //preHandle()
	        
	        return true;
	    }

}
