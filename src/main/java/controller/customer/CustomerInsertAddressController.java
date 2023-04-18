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

@WebServlet(urlPatterns = { "/customer/address.do" })
public class CustomerInsertAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = (String) request.getSession().getAttribute("id");
		
		Address ad = new Address();
		ad.setMemberid(id);
		ad.setPostcode(request.getParameter("postcode"));
		ad.setAddress(request.getParameter("address")
				+ request.getParameter("detailAddress")
				+ request.getParameter("extraAddress"));
		
		int ret = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).insertAddress(ad);
		
		if(ret == 1) {
			response.sendRedirect("mypage.do?menu=5");
			return;
		}
		response.sendRedirect("mypage.do?=menu=5");
		
	}
}
