package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class ModifyCheckProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		MemberVO vo=new MemberVO();
		vo.setPwd(request.getParameter("pwd"));
		
		HttpSession session=request.getSession();
		String sid=(String)session.getAttribute("sid");
		
		MemberDAO dao=MemberDAO.getInstance();
		int result=dao.updateCheck(vo, sid);
		System.out.println("result값"+result);
		
		request.setAttribute("result", result);
		
		return "/jsp/member/modifyCheckPro.jsp";
	}

}
