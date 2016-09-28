package study.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.notice.bean.NoticeDAO;
import study.notice.bean.NoticeVO;

public class DeleteProAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      int num = Integer.parseInt(request.getParameter("num"));
      String pageNum = request.getParameter("pageNum");
      NoticeVO vo = new NoticeVO();
      vo.setNum(Integer.parseInt(request.getParameter("num")));
      NoticeDAO dao = NoticeDAO.getInstance();
      dao.delete(num);
      request.setAttribute("pageNum", pageNum);
      return "/jsp/notice/deletePro.jsp";
   }
}