package study.freeboard.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardVO;
import study.freeboard.bean.ReplyVO;

public class ReplyProAction implements CommandAction{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		request.setCharacterEncoding("utf-8");
		FreeboardDAO dao = FreeboardDAO.getInstance();
		ReplyVO vo = new ReplyVO();
		vo.setReply_num(Integer.parseInt(request.getParameter("reply_num")));
		vo.setRe_writer(request.getParameter("re_writer"));
		vo.setRe_content(request.getParameter("re_content"));
		vo.setRe_reg_date(new Timestamp(System.currentTimeMillis()));
		int num = vo.getReply_num();
		dao.re_insert(vo);
		request.setAttribute("num", num);
		
		return "/jsp/freeboard/replyPro.jsp";
	}
}
