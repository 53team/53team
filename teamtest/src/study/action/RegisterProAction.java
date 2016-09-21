package study.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.bean.MemberDAO;
import study.bean.MemberVO;

public class RegisterProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setLocation(request.getParameter("location"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.registerMember(vo);
			
		return "/member/registerPro.jsp";
	}

}
