package study.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		Study_FreeboardDAO  dao = Study_FreeboardDAO.getInstance();
		Study_FreeboardVO vo = new Study_FreeboardVO();
		
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setPasswd(request.getParameter("passwd"));
		
		int result = dao.delete(vo);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		//request.setAttribute("num", num);
		
		return "/jsp/deletePro.jsp";
	}

}
