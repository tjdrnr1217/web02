package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 127.0.0.1:8080/web02/customer/home.do
// 127.0.0.1:8080/web02/customer/mypage.do
// 127.0.0.1:8080/web02/customer/orderlist.do
// 127.0.0.1:8080/web02/customer/orderlist1.do
@WebFilter(urlPatterns = { "/customer/mypage.do", "/customer/orderlist.do" })
public class CustomerFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		System.out.println("customer filter => " + request.getRequestURI());

		HttpSession httpSession = request.getSession();
		String sessionId = (String) httpSession.getAttribute("id");

		if (sessionId == null) { //세션 객체 없으면 로그인 페이지로.
			response.sendRedirect(request.getContextPath() + "/customer"+"/login.do");
			return;
		}

		// 컨트롤러로 가지전에 수행해야 하는 작업들..
		// 로그인이 되었는지 확인
		// 로그인이 안되었다면 로그인 페이지 이

		// 컨트롤러로 정상진입
		// 있으면 원래 수행하고자 하는 페이지로.
		arg2.doFilter(arg0, arg1);
	}

}
