package controller.purchase;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/purchase/select.do"})
public class PurchaseSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu = request.getParameter("menu");
		if(menu == null) {
			response.sendRedirect("select.do?menu=2");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/member/purchase_select.jsp").forward(request, response);
	}

}
