package com.bit.emoji;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	@Override   //preHandle() - 클라이언트의 요청을 컨트롤러에 전달하지 전에 호출
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		
		//세션이 있는지 확인
		if(session != null) {
			if(session.getAttribute("loginInfo") != null)
				return true;
		}
		
		
		//세션인 없을 때 - 로그인 하지 않았을 때
		response.sendRedirect(request.getContextPath() + "/loginForm");

		PrintWriter out = response.getWriter();
		
		out.print("<script>alert('로그인이 필요한 페이지 입니다. 로그인 화면으로 넘어갑니다.');</script>");
		
		out.flush();
		return false;  //컨트롤러를 실행시키지 않고 요청 종료
	}
}