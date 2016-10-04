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
		
		int result=5;
		
		MemberVO vo=new MemberVO();
		vo.setId(request.getParameter("id"));
		System.out.println("id값은?"+vo.getId());
		
		MemberDAO dao=MemberDAO.getInstance();
		result=dao.registerCheck(vo);
		
		request.setAttribute("result", result);
		System.out.println("result 결과값은?:"+result);
		
		return "/jsp/member/registerIDCheck.jsp";
	}

}
