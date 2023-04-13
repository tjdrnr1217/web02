package controller.customer;

import java.io.IOException;

import config.Hash;
import config.MyBatisContext;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

@WebServlet(urlPatterns = { "/customer/logout.do" , "/seller/logout.do" })
public class CustomerLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 로그아웃. (세션에 있는 기록을 지운다)
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		response.sendRedirect(request.getContextPath() + "/customer"+"/login.do");

	}

}
