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
		
		int result=0;
		
		String PWD=request.getParameter("pwd");
		String rePWD=request.getParameter("repwd");
		
		if(PWD.equals(rePWD)) {
		MemberVO vo = new MemberVO();
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setLocation(request.getParameter("location"));
		
		HttpSession session=request.getSession();
		String sid=(String)session.getAttribute("sid");
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(vo, sid);
		
		result=1;
		request.setAttribute("result", result);
		} else {
			result=0;
			request.setAttribute("result", result);
		}
		
		return "/jsp/member/modifyPro.jsp";
	}

}
