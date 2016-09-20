package study.commnad;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.*;

public class ListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize = 7;	// 화면에 출력 레코드 수 
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String  pageNum = request.getParameter("pageNum");

		if( pageNum == null ){
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize ) - 6 ;  // 시작값
		int endRow = currentPage * pageSize ;  // 끝값
		int count = 0,  number = 0;

		List list = null;

		Study_FreeboardDAO dao = Study_FreeboardDAO.getInstance();  //db 연결 
		count = dao.getListAllCount();   // 전체 페이지 리턴....

		if( count > 0 ) {
			list = dao.getSelectAll(startRow, endRow );  //레코드 목록 보기
		}
		else{
			list = Collections.EMPTY_LIST;
		}

		number = count - ( currentPage - 1 ) * pageSize ;
		
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);

		return "/board/list.jsp";
	}

}
