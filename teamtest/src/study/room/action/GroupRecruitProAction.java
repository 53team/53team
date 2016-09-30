package study.room.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.room.bean.*;

public class GroupRecruitProAction implements CommandAction {
	int num=0;

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		StudyboardVO vo = new StudyboardVO();
		vo.setId(request.getParameter("id"));
		vo.setTitle(request.getParameter("title"));
		vo.setSub_title(request.getParameter("sub_title"));
		vo.setLimit(Integer.parseInt(request.getParameter("limit")));
		vo.setLocation(request.getParameter("location"));
		vo.setCategory(request.getParameter("category"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
			
		StudyboardDAO dao = StudyboardDAO.getInstance();
		num=dao.registerGroup(vo);
		
		System.out.println("num : " + num);	
		
		StudyRoomVO vo2 = new StudyRoomVO();
		vo2.setId(request.getParameter("id"));
		vo2.setLimit(Integer.parseInt(request.getParameter("limit")));
		StudyRoomDAO dao2 = StudyRoomDAO.getInstance();
		dao2.insert(vo2);
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		request.setAttribute("num", num);
			
		return "/jsp/room/room.jsp";
	}

}
