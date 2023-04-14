package controller;

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

@WebServlet(urlPatterns = { "/board/delete.do" })
// 127.0.0.1:8080/web02/home.do
// 127.0.0.1:8080/web02/
// 127.0.0.1:8080/web02/main.do
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardMapper Mapper = MyBatisContext.getSqlSession().getMapper(BoardMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		int ret = Mapper.deleteBoard(no);
		if(ret == 1) {
			response.sendRedirect("select.do");
		}else {
			response.sendRedirect("selectone.do?no="+no);
		}
	}
	
}

