package study.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		request.setAttribute("num", new Integer(num));
		
		return "/board/writeForm.jsp";
	}

}
