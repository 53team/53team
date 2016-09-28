package study.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.notice.bean.NoticeDAO;
import study.notice.bean.NoticeVO;

public class UpdateProAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
         request.setCharacterEncoding("utf-8");
         String pageNum = request.getParameter("pageNum");
         
         NoticeVO vo = new NoticeVO();
         vo.setNum(Integer.parseInt(request.getParameter("num")));
         vo.setWriter(request.getParameter("writer"));
         vo.setSubject(request.getParameter("subject"));
         vo.setContent(request.getParameter("content"));
         
         NoticeDAO dao = NoticeDAO.getInstance();
         
          int check = dao.update(vo);
          
          request.setAttribute("check", check);
          request.setAttribute("pageNum",pageNum);

         return "/jsp/notice/updatePro.jsp";
   }

}