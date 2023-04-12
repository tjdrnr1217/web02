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

@WebServlet(urlPatterns = {"/api/member/join.json"})

// 127.0.0.1:8080/web02/api/member/idcheck.json?id=중복확인아이디
public class RestMemberJoinController extends HttpServlet {
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
		member.setName(request.getParameter("name"));
		member.setAge(Integer.parseInt(request.getParameter("age")));
		member.setRole("seller");
		System.out.println(member.toString());
		
		// 아이드를 전달하면 존재하면 1 없으면 0반환 
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).insertMemberOne(member);
			
		// 전송하는 데이터 타입설정(json문서) => text/html을
		response.setContentType("application/json");
		Map<String, Object> map = new HashMap<>();
		map.put("ret", 0); //실패시 {"ret":0}
		
		if(ret == 1) {
			map.put("ret", 1); // {"ret":1}
		}
		
		// 자바의 오브젝트타입을 json으로 변경(gson라이브러리)
		String jsonString = gson.toJson(map);
		
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();

	}
	
}

