package study.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.controller.CommandAction;
import study.member.bean.MemberDAO;
import study.member.bean.MemberVO;

public class RegisterProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String PWD=request.getParameter("pwd");
		String rePWD=request.getParameter("repwd");
		
		if(PWD.equals(rePWD)) {
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setLocation(request.getParameter("location"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.registerMember(vo);
		
		request.setAttribute("result", "1");
		} else {
			request.setAttribute("result", "0");
		}
		
		return "/jsp/member/registerPro.jsp";
	}

}
