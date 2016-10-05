package study.room.action;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.ServerEndpoint;

import study.controller.CommandAction;
import study.room.bean.StudyRoomDAO;
import study.room.bean.StudyRoomVO;
import study.room.bean.StudyboardDAO;
import study.room.bean.StudyboardVO;
import study.room.action.*;

public class RoomAction implements CommandAction{

	private static int limit;
	private static int num;
	private String category;
	private Timestamp reg_date;
	private String location;
	private String title;
	private String sub_title;
	private String id;
	private String sid2;
	private int count;
	private String ids;
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudyboardVO vo1 = new StudyboardVO();
		StudyRoomVO vo2 = new StudyRoomVO();
		StudyRoomDAO dao1 = StudyRoomDAO.getInstance();
		StudyboardDAO dao2 = StudyboardDAO.getInstance();
		
		sid2 = request.getParameter("sid2");
		if(sid2 != null){
					
			num = Integer.parseInt(request.getParameter("num"));
			/*limit = Integer.parseInt(request.getParameter("limit"));
			category = request.getParameter("category");
			vo1 = dao2.getDate(num);
			reg_date = vo1.getReg_date();
			location*/
			vo1 = dao2.getDate(num);
			limit = vo1.getLimit();
			category =vo1.getCategory();
			reg_date= vo1.getReg_date();
			location = vo1.getLocation();
			title = vo1.getTitle();
			sub_title = vo1.getSub_title();
			id = vo1.getId();
			
			count = dao1.join(id, sid2, num);
			
			ids = dao1.selectIds(id, num);
			System.out.println("ids : " + ids);
		    request.setAttribute("ids", ids);

			request.setAttribute("num", num);
			request.setAttribute("limit", limit);
			request.setAttribute("category", category);
			request.setAttribute("reg_date", reg_date);
			request.setAttribute("location", location);
			request.setAttribute("title", title);
			request.setAttribute("content", sub_title);
			request.setAttribute("id", id);
			request.setAttribute("count", count);
			
			HttpSession session=request.getSession();
		    String sid = (String)session.getAttribute("sid");
		    request.setAttribute("sid", sid);
			
			return "/jsp/room/room.jsp";

		}

			num = Integer.parseInt(request.getParameter("num"));

			vo1 = dao2.getDate(num);
			limit = vo1.getLimit();
			category =vo1.getCategory();
			reg_date= vo1.getReg_date();
			location = vo1.getLocation();
			title = vo1.getTitle();
			sub_title = vo1.getSub_title();
			id = vo1.getId();

			request.setAttribute("limit", limit);
			request.setAttribute("category", category);
			request.setAttribute("reg_date", reg_date);
			request.setAttribute("location", location);
			request.setAttribute("title", title);
			request.setAttribute("content", sub_title);
			request.setAttribute("id", id);
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();

			HttpSession session=request.getSession();
		    String sid = (String)session.getAttribute("sid");
		    
		    ids = dao1.selectIds(id, num);
		    System.out.println("ids : " + ids);
		    request.setAttribute("ids", ids);
			count = dao1.selectCount(num);
			request.setAttribute("count", count);
			
			//room.jsp에서는 EL값을 id로 받음
			request.setAttribute("sid", sid);
			//방번호 넘김
			request.setAttribute("num", num);
		
		return "/jsp/room/room.jsp";
	}

}
