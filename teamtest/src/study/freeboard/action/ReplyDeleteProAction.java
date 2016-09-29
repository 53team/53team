package study.freeboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.ReplyVO;

public class ReplyDeleteProAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   request.setCharacterEncoding("utf-8");
	   ReplyVO vo = new ReplyVO();
	   vo.setRe_num(Integer.parseInt(request.getParameter("re_num")));
	   vo.setReply_num(Integer.parseInt(request.getParameter("reply_num")));
	   FreeboardDAO dao = FreeboardDAO.getInstance();
	   int num = vo.getReply_num();
	   dao.re_delete(vo);
	   request.setAttribute("num", num);
      
      return "/jsp/freeboard/replyDeletePro.jsp";
   }
}