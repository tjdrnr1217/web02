package cotroller;

import java.io.IOException;

import java.util.List;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns = { "/board/select.do" })
// 127.0.0.1:8080/web02/home.do
// 127.0.0.1:8080/web02/
// 127.0.0.1:8080/web02/main.do
public class BoardSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주소창에 select.do?page=1가 없을 경우 처리
		String page = request.getParameter("page");
		if(page == null) {
			response.sendRedirect("select.do?page=1"); // 강제로 page=1
			return; //메소드 종료시키기
		}
		
		// 1 =>  1 10
		// 2 => 11 20
		
		// 페이지네이션 시작값
		int start = Integer.parseInt(page)*10-9;
		// 페이지네이션 종료값
		int end   = Integer.parseInt(page)*10;
		
		// 1. DB에서 게시글 전체 읽기
		List<Board> list = MyBatisContext.getSqlSession()
				.getMapper(BoardMapper.class).selectBoardListPage(start, end);
		
		// 게시글 전체 개수
		long cnt = MyBatisContext.getSqlSession()
				.getMapper(BoardMapper.class).countBoardList();
		
		// 2. view로 list전달 
		request.setAttribute("list", list);
		request.setAttribute("pages", (cnt-1) / 10 + 1);
		
		// 3. board_select.jsp화면에 표시
		request.getRequestDispatcher("/WEB-INF/board_select.jsp").forward(request, response);
	}
	
}

