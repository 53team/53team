package study.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.ServerEndpoint;

import study.controller.CommandAction;
import study.room.bean.StudyRoomDAO;
import study.room.bean.StudyRoomVO;

public class RoomAction implements CommandAction{

	private static String id;
	private static String id2;
	private static String sub_id;
	private static String sid;
	private static int count;
	private static int num;
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudyRoomVO vo = new StudyRoomVO();
		vo.setSub_id(request.getParameter("sub_id"));
		id = request.getParameter("id");
		id2 = request.getParameter("id2");
		sub_id = request.getParameter("sub_id");
		num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("id : " + id );
		System.out.println("id2 : " + id2 );
		System.out.println("sub_id : " + sub_id );
		
		StudyRoomDAO dao = StudyRoomDAO.getInstance();
		if(id == null){
			dao.join(vo, id2);
			String result;
			result = dao.select(id2);
			request.setAttribute("id", id2);
			request.setAttribute("result", result);
		}
		else{
			String result;
			result = dao.select(id);
			request.setAttribute("id", id);
			request.setAttribute("result", result);
		}

		HttpSession session=request.getSession();
	    String sid = (String)session.getAttribute("sid");
		
		request.setAttribute("count", count);
		//room.jsp에서는 EL값을 id로 받음
		request.setAttribute("id", sid);
		//방번호 넘김
		request.setAttribute("num", num);
		
		return "/jsp/room/room.jsp";
	}

}
