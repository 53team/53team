package study.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;

public class GroupRecruitFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
	    String sid = (String)session.getAttribute("sid");
	         
	    request.setAttribute("sid", sid);
		return "/jsp/room/groupForm.jsp";
	}

}
