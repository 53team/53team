package study.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;

public class RoomFullAction implements CommandAction {
	private int limit;
	private int count;
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		limit = Integer.parseInt(request.getParameter("limit"));
		count = Integer.parseInt(request.getParameter("count"));
		
		
		
		return "/jsp/room/roomFull.jsp";
	}

}
