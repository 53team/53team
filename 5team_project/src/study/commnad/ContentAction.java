package study.commnad;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");


		Study_FreeboardDAO dao = Study_FreeboardDAO.getInstance();
		Study_FreeboardVO vo = dao.getDataDetail(num); //상세 보기 함수 호출
				
		/*int ref = vo.getRef();
		int re_step = vo.getRe_step();
		int re_level = vo.getRe_level();
				
		System.out.print("content.jsp : ref : " + ref + ", re_step : " + re_step + ", re+level : " + re_level);*/
	
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("vo", vo);
		
		System.out.println("pageNum : " + pageNum);
				
		return "/board/content.jsp";
	}

}
