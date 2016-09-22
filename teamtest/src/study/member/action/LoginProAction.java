package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class LoginProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberVO vo=new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.loginCheck(vo);
		
		request.setAttribute("result", result);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("sid", request.getParameter("id"));
		}
		
		return "/jsp/member/loginPro.jsp";
	}

}