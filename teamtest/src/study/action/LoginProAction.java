package study.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import study.bean.MemberDAO;
import study.bean.MemberVO;

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
		
		return "/member/loginPro.jsp";
	}

}