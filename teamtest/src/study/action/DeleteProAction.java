package study.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.FreeboardDAO;
import study.bean.FreeboardVO;

public class DeleteProAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      int num = Integer.parseInt(request.getParameter("num"));
      String writer = request.getParameter("writer");
      String pageNum = request.getParameter("pageNum");

      FreeboardVO vo = new FreeboardVO();
      vo.setNum(Integer.parseInt(request.getParameter("num")));

      FreeboardDAO dao = FreeboardDAO.getInstance();
      int check = dao.delete(num, writer);
      
        request.setAttribute("check", check);
        request.setAttribute("pageNum", pageNum);


      return "/board/deletePro.jsp";
   }

}