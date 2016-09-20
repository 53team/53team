package study.commnad;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class DeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		Study_FreeboardDAO dao = Study_FreeboardDAO.getInstance();
		Study_FreeboardVO vo = dao.delete(num);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);

		return "/board/deleteForm.jsp";
	}

}
