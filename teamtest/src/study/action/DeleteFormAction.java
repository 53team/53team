package study.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.FreeboardDAO;
import study.bean.FreeboardVO;

public class DeleteFormAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      int num = Integer.parseInt(request.getParameter("num"));
      String pageNum = request.getParameter("pageNum");
      
      try {
         
         FreeboardDAO dao = FreeboardDAO.getInstance();
         FreeboardVO vo = dao.update(num);
         
         request.setAttribute("num", vo.getNum());
         request.setAttribute("writer", vo.getWriter());
         request.setAttribute("subject", vo.getSubject());
         request.setAttribute("content", vo.getContent());
          request.setAttribute("pageNum", pageNum);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "/board/deleteForm.jsp";
   }

}