package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class WithdrawalProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberVO vo=new MemberVO();
		vo.setPwd(request.getParameter("pwd"));
		
		HttpSession session=request.getSession();
		String sid=(String)session.getAttribute("sid");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result=dao.deleteMember(vo, sid);
		
		request.setAttribute("result", result);
		
		if(result==1){
		session.invalidate();
		}
		
		
		return "/jsp/member/withdrawalPro.jsp";
	}

}
