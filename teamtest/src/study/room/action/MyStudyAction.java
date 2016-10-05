package study.room.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;
import study.room.bean.StudyRoomDAO;
import study.room.bean.StudyboardVO;

public class MyStudyAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List list=null;
		List list2 = null;
		List countList1 = null;
		List countList2 = null;
		
		StudyboardVO vo=new StudyboardVO();
		StudyRoomDAO dao=StudyRoomDAO.getInstance();
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("sid");
		
		System.out.println("세션id값은:"+id);
		vo.setId(id);
		System.out.println("vo.getid가 잘 출력되는가?:"+vo.getId());
		list=dao.getMyRoom(vo);
		list2 = dao.getJoinRoom(id);
		countList1 = dao.countIDList(id);
		countList2 = dao.countSubList(id);
		
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		System.out.println("list는 있는가?:"+list);
		System.out.println("list2 : " + list2);
		request.setAttribute("cList1", countList1);
		request.setAttribute("cList2", countList2);

		return "/jsp/room/myStudy.jsp";
	}

}
