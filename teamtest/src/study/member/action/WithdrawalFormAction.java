package study.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.controller.CommandAction;

public class WithdrawalFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/jsp/member/withdrawalForm.jsp";
	}

}
