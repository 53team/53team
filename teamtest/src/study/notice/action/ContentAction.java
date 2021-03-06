package study.notice.action;

import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import study.controller.CommandAction;
import study.notice.bean.NoticeDAO;
import study.notice.bean.NoticeVO;

public class ContentAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			NoticeVO vo = dao.getDataDetail(num); 
			HttpSession session = request.getSession();
			String sid = (String)session.getAttribute("sid");
			request.setAttribute("sid", sid);
			request.setAttribute("num", vo.getNum());
			request.setAttribute("writer", vo.getWriter());
			request.setAttribute("subject", vo.getSubject());
			request.setAttribute("readnum", vo.getReadnum());
			request.setAttribute("content", vo.getContent());
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("reg_date", sdf.format(vo.getReg_date()));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/jsp/notice/content.jsp";
	}

}
