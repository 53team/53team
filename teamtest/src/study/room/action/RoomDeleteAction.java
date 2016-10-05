package study.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.room.bean.StudyboardDAO;
import study.room.bean.StudyboardVO;

public class RoomDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		StudyboardVO vo=new StudyboardVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		
		StudyboardDAO dao=StudyboardDAO.getInstance();
		dao.roomDelete(vo);
		
		return "/jsp/room/roomDelete.jsp";
	}

}
