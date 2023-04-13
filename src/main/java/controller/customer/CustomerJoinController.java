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
import mapper.MemberMapper;

@WebServlet(urlPatterns = {"/customer/join.do"})
public class CustomerJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CustomerJoinController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/member/customer_join.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hashpw = Hash.hashPW(request.getParameter("id"),
				request.getParameter("pw"));
		
		// 전송되는 4개 값 받기
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword( hashpw );
		obj.setName(request.getParameter("name"));
		obj.setAge(Integer.parseInt(request.getParameter("age")) );
		obj.setRole("customer");
		// 객체생성 role => CUSTOMER
		// mapper를 이용해서 추가
		MemberMapper mapper = MyBatisContext.getSqlSession().getMapper(MemberMapper.class);
		
		long ret = mapper.insertMemberOne(obj);
		
		if(ret == 1) {// 127.0.0.1:8080/web02/customer/home.do
			response.sendRedirect(request.getContextPath() + "/customer/home.do");
		}
		else{
			response.sendRedirect(request.getContextPath() + "/customer/join.do");
		}
			
	}

}
