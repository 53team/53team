package study.freeboard.action;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;

public class ListAction implements CommandAction {

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
		
		FreeboardDAO dao = FreeboardDAO.getInstance(); 
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
		System.out.println("number"+number);
		return "/jsp/freeboard/list.jsp";
	}

}
