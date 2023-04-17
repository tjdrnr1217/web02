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

@WebServlet(urlPatterns = { "/customer/login.do" })
public class CustomerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/member/customer_login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String hashpw = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));

		// 전송되는 4개 값 받기
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(hashpw);

		MemberMapper mapper = MyBatisContext.getSqlSession().getMapper(MemberMapper.class);

		Member ret = mapper.LoginMember(obj);

		if (ret != null) {
			// 세션에 기록하기. 30분
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", ret.getId());
			httpSession.setAttribute("role", ret.getRole());
			httpSession.setAttribute("name", ret.getName());

			String url = (String) httpSession.getAttribute("url");
			httpSession.setAttribute("url", null);

			if (ret.getRole().equals("customer")) {
				if (url == null) {
					response.sendRedirect(request.getContextPath() + "/customer" + "/home.do");
					return;
				} else {// 마지막페이지로 이동될수 있게 변경...
					response.sendRedirect(url);
					return;
				}
			} else {
				if (url == null) {
					response.sendRedirect(request.getContextPath() + "/seller" + "/home.do");
					return;
				} else {// 마지막페이지로 이동될수 있게 변경...
					response.sendRedirect(url);
					return;
				}
			}
		} else {
			response.sendRedirect("login.do");

		}
		
		
		
		
	}
}
