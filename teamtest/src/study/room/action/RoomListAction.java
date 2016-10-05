package study.room.action;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;
import study.room.bean.StudyRoomDAO;
import study.room.bean.StudyRoomVO;
import study.room.bean.StudyboardDAO;

public class RoomListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);
		int count = 0;
		int number = 0;
		
		List list = null;
		
		StudyboardDAO dao = StudyboardDAO.getInstance(); 
		count = dao.getListAllCount(); 
		int startRow = count-((currentPage-1) * pageSize) -9; 
		int endRow = startRow + 9;
		
		if(count > 0) {
			list = dao.getSelectAll(startRow, endRow); 
		} else {
			list = Collections.EMPTY_LIST;
		}
		number = count - (currentPage - 1) * pageSize;
		
		

		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		request.setAttribute("num", session.getAttribute("sid"));

		List list2 = null;
		list2 = dao.countList(startRow, endRow);
		request.setAttribute("list2", list2);
		
		/*StudyRoomDAO dao2 = StudyRoomDAO.getInstance();
		String result = dao2.select(request.getParameter("id"));
		request.setAttribute("id_list", result);*/
	
		return "/jsp/room/roomList.jsp";
	}
}
