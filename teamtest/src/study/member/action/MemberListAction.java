package study.member.action;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardPageVO;
import study.member.bean.MemberDAO;
import study.member.bean.MemberPageVO;
import study.member.bean.MemberVO;

public class MemberListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String pageNum = request.getParameter("pageNum");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		if(pageNum == null) pageNum = "1";
		
		MemberDAO dao = MemberDAO.getInstance(); 
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		List<MemberVO> list = null;
		int count = dao.getListAllCount();
		int startRow = count - ((currentPage - 1) * pageSize) - 9;
		int endRow = startRow + 9;
		int number = 0;
		
		if(count > 0) {
			list = dao.getSelectAll(startRow, endRow); 
		}
		number = count - (currentPage - 1) * pageSize;
		
		MemberPageVO vo = new MemberPageVO();
	    vo.setCount(count);
	    vo.setCurrentPage(currentPage);
	    vo.setNumber(number);
	    vo.setPageSize(pageSize);  
	    
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		
		return "/jsp/member/memberList.jsp";
	}

}
