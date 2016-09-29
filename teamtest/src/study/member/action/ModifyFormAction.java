package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class ModifyFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      HttpSession session = request.getSession();
	      String sid = (String)session.getAttribute("sid");
	      try {
	         MemberDAO dao = MemberDAO.getInstance();
	         MemberVO vo = dao.updateMember(sid);
	         request.setAttribute("name", vo.getName());
	         request.setAttribute("phone", vo.getPhone());
	         request.setAttribute("location", vo.getLocation());
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
		return "/jsp/member/modifyForm.jsp";
	}

}
