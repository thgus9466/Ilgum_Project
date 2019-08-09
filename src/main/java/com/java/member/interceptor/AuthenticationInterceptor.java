package com.java.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.java.aop.IlgumAspect;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        // session 객체를 가져옴
		 IlgumAspect.logger.info(IlgumAspect.logMsg + request.getSession().getAttribute("login"));
		 
		 Object obj = request.getSession().getAttribute("login");
		 
		 if(obj == null) {
			 response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");
		 		return false;
		 	}
				return true;

	        }
	 
	    // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        // TODO Auto-generated method stub
	        super.postHandle(request, response, handler, modelAndView);
	    }

}
