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
		int idcheck = 0;	//-1은 중복, 0은 중복없음
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id"));
		//아이디 중복체크 메소드
		idcheck = dao.idCheck(vo);
		
		if(idcheck==0){
			if(PWD.equals(rePWD)) {
				//아이디는 위에서 받았기때문에 또 받아올 필요는 없음
				vo.setId(request.getParameter("id"));
				vo.setPwd(request.getParameter("pwd"));
				vo.setName(request.getParameter("name"));
				vo.setPhone(request.getParameter("phone"));
				vo.setLocation(request.getParameter("location"));
				vo.setReg_date(new Timestamp(System.currentTimeMillis()));
				
				//회원등록
				dao.registerMember(vo);
				
				request.setAttribute("result", "1");
			} else {
				request.setAttribute("result", "0");
			}
		} else {
			request.setAttribute("result", idcheck);
		}
		
		
		return "/jsp/member/registerPro.jsp";
	}

}
