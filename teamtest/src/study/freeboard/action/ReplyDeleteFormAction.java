package study.freeboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardVO;
import study.freeboard.bean.ReplyVO;

public class ReplyDeleteFormAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      int re_num = Integer.parseInt(request.getParameter("re_num"));
      
      String reply_num = request.getParameter("reply_num");
      
      try {
         
         FreeboardDAO dao = FreeboardDAO.getInstance();
         ReplyVO vo = dao.re_select(re_num);

         
        
         request.setAttribute("re_num", vo.getRe_num());
         request.setAttribute("re_writer", vo.getRe_writer());
         request.setAttribute("re_content", vo.getRe_content());
         request.setAttribute("re_reg_date", vo.getRe_reg_date());
         request.setAttribute("reply_num", reply_num);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "/jsp/freeboard/replyDeleteForm.jsp";
   }

}
