package study.freeboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;
import study.freeboard.bean.FreeboardDAO;

public class BottonProAction implements CommandAction {
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FreeboardDAO dao = FreeboardDAO.getInstance();
		String[] check = request.getParameterValues("check");
		int checklen = 0;
		checklen = check.length;
		if(check != null || checklen > 0){
		for(int i = 0 ; i < checklen; i++){			
			String test = check[i];
			dao.delete(test);
			}
		}
		return "/jsp/freeboard/deletePro.jsp";
	}
}
