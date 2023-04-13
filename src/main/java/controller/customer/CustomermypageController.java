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

@WebServlet(urlPatterns = { "/customer/mypage.do" })
public class CustomermypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String menu = request.getParameter("menu");
		if (menu == null) {
			response.sendRedirect("mypage.do?menu=1");
			return; // 메소드 종료. 아래쪽 실행 안됨.
		}

		String id = (String) request.getSession().getAttribute("id");

		if (Integer.parseInt(menu) == 1 || Integer.parseInt(menu) == 3) { // 정보변경시
			// mapper를 이용해서 이름과 나이를 받아온다.
			Member obj = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberOne(id);
			request.setAttribute("obj", obj);
		}
		
		request.getRequestDispatcher("/WEB-INF/member/customer_mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int menu = Integer.parseInt(request.getParameter("menu"));
		if (menu == 1) {
			String id = (String) request.getSession().getAttribute("id");

			Member obj = new Member();
			obj.setId(id);
			obj.setName(request.getParameter("name"));
			obj.setAge(Integer.parseInt(request.getParameter("age")));

			// mapper호출후 변경하기
			MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updateMemberone(obj);

		} else if (menu == 2) {
			String id = (String) request.getSession().getAttribute("id");
			String hashPw = Hash.hashPW(id, request.getParameter("pw"));
			String hashPw1 = Hash.hashPW(id, request.getParameter("pw1"));
			
			Member member = new Member();
			member.setId(id);
			member.setPassword(hashPw);
			member.setPassword1(hashPw1);
			
			int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updatepasswordMemberOne(member);
			if(ret == 1) {
				response.sendRedirect("login.do");
				return;
			}
		} else if (menu == 3) {
			String id = (String) request.getSession().getAttribute("id");
			String Pw = Hash.hashPW(id, request.getParameter("password"));
			
			Member member = new Member();
			member.setId(id);
			member.setPassword(Pw);
			
			int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).deleteMemberOne(member);
			if(ret == 1) {
				HttpSession httpSession = request.getSession();
				httpSession.invalidate();
			}
			
		} else if (menu == 4) {
			
		}
		response.sendRedirect("mypage.do?menu=" + menu);
	}
}
