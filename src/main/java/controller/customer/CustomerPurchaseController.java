package controller.customer;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Purchase;
import dto.PurchaseView;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.PurchaseMapper;

@WebServlet(urlPatterns = { "/customer/purchase.do" })
public class CustomerPurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");
		
		
		List<PurchaseView> aa = MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).selectPurchaseViewMember(id);
		
		request.setAttribute("aa", aa);
		
		request.getRequestDispatcher("/WEB-INF/member/customer_purchase.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// DB에 추가하기
		Long itemno = Long.parseLong(request.getParameter("itemno"));
		Long cnt = Long.parseLong(request.getParameter("cnt"));
		
		Purchase obj = new Purchase();
		obj.setItemno(itemno);
		obj.setCnt(cnt);
		obj.setCustomerid((String) request.getSession().getAttribute("id"));
		
		int ret = MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).insertPurchaseOne(obj);
		
		if( ret == 1) {
			response.sendRedirect(request.getContextPath() + "/customer" + "/home.do");
		}

	}

}
