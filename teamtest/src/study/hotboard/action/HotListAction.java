package study.hotboard.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.hotboard.bean.HotBoardDAO;
import study.hotboard.bean.HotBoardVO;

public class HotListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotBoardDAO dao = new HotBoardDAO();
		Vector<HotBoardVO> vector = new Vector<HotBoardVO>();
		
		vector = dao.countCategory();
		request.setAttribute("vector", vector);
		
		int count = dao.usercount();
	      
		request.setAttribute("usercount", count);
		
		return "/jsp/hot/hotList.jsp";
	}

}
