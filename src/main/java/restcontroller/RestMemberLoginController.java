package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

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

@WebServlet(urlPatterns = {"/api/member/login.json"})

// 127.0.0.1:8080/web02/api/member/idcheck.json?id=중복확인아이디
public class RestMemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson(); //라이브러리를 이용한 객체 생성 
	// Gson은 Json을 파싱하고 생성하기 위해 사용된다
    // Java Object를 Json 문자열로 변환할 수 있고, Json 문자열을 Java Object로 변환할 수 있다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받는 문자로된 페이지 정보
		String hashPw = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));
		
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPassword(hashPw);
		
		
		// 아이드를 전달하면 존재하면 1 없으면 0반환 
		Member ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).LoginMember(member);
		System.out.println(ret.toString());
			
		// 전송하는 데이터 타입설정(json문서) => text/html을
		response.setContentType("application/json");
		Map<String, Object> map = new HashMap<>();
		map.put("ret", 0); //실패시
		if(ret != null) {
			// react.js, vue.js등의 프론트엔드 프레임워크 개발시 토큰을 발행신킴 토큰발행 ...
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", ret.getId());
			httpSession.setAttribute("role", ret.getRole());
			httpSession.setAttribute("name", ret.getName());
			map.put("ret", 1);
		}
		String jsonString = gson.toJson(map);
		//데이터의 객
		
		// 호출된 곳으로 값 전송
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();

	}
	
}

