package study.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import study.controller.CommandAction;

public class WriteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0;
		
		try {
			if (request.getParameter("num") != null) { 
				num = Integer.parseInt(request.getParameter("num"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		String sid = (String)session.getAttribute("sid");

		request.setAttribute("sid", sid);
		request.setAttribute("num", new Integer(num));
		
		return "/jsp/notice/writeForm.jsp";
	}

}
