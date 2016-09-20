package study.commnad;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		Study_FreeboardDAO  dao = Study_FreeboardDAO.getInstance();
		Study_FreeboardVO vo = new Study_FreeboardVO();
		
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setWriter(request.getParameter("writer"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		//vo.setRef(Integer.parseInt(request.getParameter("ref")));
		//vo.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		//vo.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		int check = dao.update(vo);  //실제 변경 내용을 반영하는 함수
		
		System.out.println("pageNum : " + pageNum);
		
		request.setAttribute("check", check);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("vo", vo);
		
		return "/board/updatePro.jsp";
	}

}
