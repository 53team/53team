package study.freeboard.action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardPageVO;
import study.freeboard.bean.FreeboardVO;
import study.freeboard.bean.ReplyPageVO;
import study.freeboard.bean.ReplyVO;

public class ContentAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		FreeboardDAO dao = FreeboardDAO.getInstance();
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			FreeboardVO vo = dao.getDataDetail(num); 
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
			request.setAttribute("reply_num", num);
		    ////////////// 
		    int reply_num = Integer.parseInt(request.getParameter("num"));
//		    int pageSize = 10;
//		    int currentPage = 1;
		    int count = dao.re_getListAllCount(reply_num); 
//		    int startRow = count - ((currentPage - 1) * pageSize) - 9;
//		    int endRow = startRow + 9;
//		    int number = 0;
		    List<ReplyVO> list = null;
		    System.out.println("count :" + count + ", num : " + reply_num);
		    if(count > 0){
		        list = dao.re_getSelectAll(reply_num);
		    }
//		    number = count - (currentPage - 1) * pageSize;

//		    ReplyPageVO fvo= new ReplyPageVO();
//		    fvo.setCount(count);
//		    fvo.setCurrentPage(currentPage);
//		    fvo.setNumber(number);
//		    fvo.setPageSize(pageSize);

//		    request.setAttribute("vo", fvo);
		    request.setAttribute("count", count);
		    request.setAttribute("list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/jsp/freeboard/content.jsp";
	}

}
