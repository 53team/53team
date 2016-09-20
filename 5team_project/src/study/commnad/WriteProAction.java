package study.commnad;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Study_FreeboardVO vo = new Study_FreeboardVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setWriter(request.getParameter("writer"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		Study_FreeboardDAO dao = Study_FreeboardDAO.getInstance();
		dao.insert(vo);
		
		return "/board/writePro.jsp";
	}

}
