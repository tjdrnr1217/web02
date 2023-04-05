package day08;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/singlepage.do"})
// 127.0.0.1:8080/web02/home.do
// 127.0.0.1:8080/web02/
// 127.0.0.1:8080/web02/main.do
public class SinglePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SinglePageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// main.jsp파일 실행
		request.getRequestDispatcher("/WEB-INF/day08/singlePage_web.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
