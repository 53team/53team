package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class ModifyProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberVO vo = new MemberVO();
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setLocation(request.getParameter("location"));
		
		HttpSession session=request.getSession();
		String sid=(String)session.getAttribute("sid");
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(vo, sid);
		
		return "/jsp/member/modifyPro.jsp";
	}

}
