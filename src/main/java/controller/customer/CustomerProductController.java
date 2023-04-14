package controller.customer;

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

@WebServlet(urlPatterns = { "/customer/product.do" })
public class CustomerProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String itemno = request.getParameter("itemno");
		if(itemno == null) {
			response.sendRedirect("home.do");
			return;
		}
		// itemmapper에서 물품번호 받기
		Item obj = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemOne(Long.parseLong(itemno));
		request.setAttribute("obj", obj);
		
		// itemimage에서 물품이미지 번호 받기(전체)
		List<Long> imageNo = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectImageOne(Long.parseLong(itemno));
		request.setAttribute("imageNo", imageNo);
		
		request.getRequestDispatcher("/WEB-INF/member/customer_product.jsp").forward(request, response);
	}

}
