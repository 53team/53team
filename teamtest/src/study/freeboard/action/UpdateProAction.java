package study.freeboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;
import study.freeboard.bean.FreeboardVO;

public class UpdateProAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
         request.setCharacterEncoding("utf-8");
         String pageNum = request.getParameter("pageNum");
         
         FreeboardVO vo = new FreeboardVO();
         vo.setNum(Integer.parseInt(request.getParameter("num")));
         vo.setWriter(request.getParameter("writer"));
         vo.setSubject(request.getParameter("subject"));
         vo.setContent(request.getParameter("content"));
         
         FreeboardDAO dao = FreeboardDAO.getInstance();
         
          int check = dao.update(vo);
          
          request.setAttribute("check", check);
          request.setAttribute("pageNum",pageNum);

         return "/jsp/freeboard/updatePro.jsp";
   }

}