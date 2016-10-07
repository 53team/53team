package study.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.notice.bean.NoticeDAO;
import study.notice.bean.NoticeVO;

public class DeleteFormAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      int num = Integer.parseInt(request.getParameter("num"));
      String pageNum = request.getParameter("pageNum");
      
      try {        
         request.setAttribute("num", num);
         request.setAttribute("pageNum", pageNum);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "/jsp/notice/deleteForm.jsp";
   }

}