package study.commnad;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class UpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0, ref=1, re_step=0, re_level=0;

		num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		Study_FreeboardDAO dao = Study_FreeboardDAO.getInstance();
		Study_FreeboardVO vo = dao.update(num);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("vo", vo);
		
		System.out.println("pageNum : " + pageNum);
		return "/board/updateForm.jsp";
	}

}
