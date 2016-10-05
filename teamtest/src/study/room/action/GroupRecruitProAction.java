package study.room.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;
import study.room.bean.*;

public class GroupRecruitProAction implements CommandAction {
	int num=0;
	private String ids;
	private String id;

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
request.setCharacterEncoding("UTF-8");
		
		StudyboardVO vo = new StudyboardVO();
		vo.setId(request.getParameter("id"));
		vo.setTitle(request.getParameter("title"));
		//sub title 은 content로 변경할거
		vo.setSub_title(request.getParameter("content"));
		vo.setLimit(Integer.parseInt(request.getParameter("limit")));
		vo.setLocation(request.getParameter("location"));
		vo.setCategory(request.getParameter("category"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
			
		StudyboardDAO dao = StudyboardDAO.getInstance();
		dao.registerGroup(vo);
		
		request.setAttribute("num", vo.getNum());
		request.setAttribute("limit", vo.getLimit());
		//작성자이자 채팅의 ID
		request.setAttribute("id", vo.getId());
		//글번호이자 채팅의 ROOMNUMBER
		request.setAttribute("reg_date", vo.getReg_date());
		request.setAttribute("title", vo.getTitle());
		request.setAttribute("content", vo.getSub_title());
		request.setAttribute("location", vo.getLocation());
		request.setAttribute("category", vo.getCategory());
		
		HttpSession session=request.getSession();
		String sid=(String)session.getAttribute("sid");
		request.setAttribute("sid", sid);
		
		StudyRoomVO vo2 = new StudyRoomVO();
		vo2.setNum(vo.getNum());
		vo2.setId(request.getParameter("id"));
		vo2.setLimit(Integer.parseInt(request.getParameter("limit")));
		StudyRoomDAO dao2 = StudyRoomDAO.getInstance();
		dao2.insert(vo2);
		
		num = vo.getNum();
		id = request.getParameter("id");
		System.out.println("id : " + id);
		ids = dao2.selectIds(id, num);
		System.out.println("ids : " + ids);
		System.out.println("num : " + num);
		request.setAttribute("ids", ids);
		
		request.setAttribute("count", vo2.getCount());
		
		return "/jsp/room/room.jsp";
	}

}
