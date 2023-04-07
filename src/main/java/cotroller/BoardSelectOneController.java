package cotroller;

import java.io.IOException;


import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns = { "/board/selectone.do" })
// 127.0.0.1:8080/web02/home.do
// 127.0.0.1:8080/web02/
// 127.0.0.1:8080/web02/main.do
public class BoardSelectOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 주소창의 no값 가져오기
		String no = request.getParameter("no");
		// 2. no값이 없으면 목록으로 보내기
		if(no == null) {
			response.sendRedirect("select.do");
			return;
		}
		// 3. no값을 이용해서 mapper 호출후 결과 받기
		BoardMapper mapper = MyBatisContext.getSqlSession().getMapper(BoardMapper.class);
		Board board = mapper.selectOneBoard(Long.parseLong(no));
		long next = mapper.selectNextBoardOne(Long.parseLong(no));
		long prev = mapper.selectPrevBoardOne(Long.parseLong(no));
		
		
		
		
		// 3.1 이전글, 다음글
		
		// 4. view로 전달
		request.setAttribute("brd", board);
		request.setAttribute("next", next);
		request.setAttribute("prev", prev);
		
		// 5. view로 표시
		request.getRequestDispatcher("/WEB-INF/board_selectone.jsp").forward(request, response);
	}
		
}

