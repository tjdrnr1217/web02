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

@WebServlet(urlPatterns = {"/board/update.do"})
public class BoardUpdateOneController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
    public BoardUpdateOneController() {
        super();
    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      BoardMapper mapper = MyBatisContext.getSqlSession().getMapper(BoardMapper.class);
   
      long no = Long.parseLong(request.getParameter("no"));
      Board obj = mapper.selectOneBoard(no);
      request.setAttribute("obj", obj);      
      request.getRequestDispatcher("/WEB-INF/board_update.jsp").forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      BoardMapper mapper = MyBatisContext.getSqlSession().getMapper(BoardMapper.class);
      
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String writer = request.getParameter("writer");
      long no = Long.parseLong(request.getParameter("no"));
      
      
      
      Board board = new Board();
      board.setTitle(title);
      board.setContent(content);
      board.setWriter(writer);
      
      int ret = mapper.updateBoard(board);
      
      if(ret==1) {
         response.sendRedirect("selectone.do?no="+no);
      }
      else {
         response.sendRedirect("updateone.do?no="+no);
      }
      
   }

}