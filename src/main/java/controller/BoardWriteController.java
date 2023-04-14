package controller;

import java.io.IOException;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns = {"/board/Write.do"})
// 127.0.0.1:8080/web02/home.do
// 127.0.0.1:8080/web02/
// 127.0.0.1:8080/web02/main.do
public class BoardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardWriteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// main.jsp파일 실행
		request.getRequestDispatcher("/WEB-INF/board_write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(writer);
		
		// 1. DB추가하기
		
		// 2. 적절한 페이지로 이동
		
		int ret = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).insertBoardOne(board);
		
		if(ret == 1) {
		response.sendRedirect("select.do");
		}
		
		else {
			response.sendRedirect("writer.do");
		}
	}

}
