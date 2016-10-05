package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class RegisterIDCheckAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int result=0;
		
		MemberVO vo=new MemberVO();
		vo.setId(request.getParameter("id"));
		
		MemberDAO dao=MemberDAO.getInstance();
		result=dao.registerCheck(vo);
		
		request.setAttribute("result", result);
		
		return "/jsp/member/registerIDCheck.jsp";
	}

}
