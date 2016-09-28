package study.freeboard.action;

import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardVO;

public class WriteProAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		request.setCharacterEncoding("utf-8");		
		FreeboardVO vo = new FreeboardVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setWriter(request.getParameter("writer"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		/*vo.setReadnum(Integer.parseInt(request.getParameter("readnum")));*/
		FreeboardDAO dao = FreeboardDAO.getInstance();
		dao.insert(vo);
		
		return "/jsp/freeboard/writePro.jsp";
	}

}










