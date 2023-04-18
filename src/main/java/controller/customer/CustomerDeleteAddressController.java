package controller.customer;

import java.io.IOException;
import java.util.List;

import config.Hash;
import config.MyBatisContext;
import dto.Address;
import dto.Member;
import dto.PurchaseView;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.AddressMapper;
import mapper.MemberMapper;
import mapper.PurchaseMapper;

@WebServlet(urlPatterns = { "/customer/deleteaddress.do" })
public class CustomerDeleteAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = (String)request.getSession().getAttribute("id");

		
		Address ad = new Address();
		ad.setNo(Long.parseLong(request.getParameter("no")));
		ad.setMemberid(id);
		
		int ret = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).deleteAddress(ad);
		
		if(ret == 1) {
			response.sendRedirect("mypage.do?menu=5");
			return;
		}
		else {
			response.sendRedirect("mypage.do?menu=5");
		}
		
	}
}
