package study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/jsp/temp/main.jsp";
	}
	
}
