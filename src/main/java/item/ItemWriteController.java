package item;

import java.io.IOException;

import config.MyBatisContext;
import dto.Board;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/item/write.do"})
public class ItemWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ItemWriteController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/item/item_write.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("iname");
		String price = request.getParameter("iprice");
		String quantity = request.getParameter("iquantity");
		String content = request.getParameter("icontent");
		
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		
		Item item = new Item();
		item.setName(name);
		item.setContent(content);
		item.setPrice(Long.parseLong(price));
		item.setQuantity(Long.parseLong(quantity));
		System.out.println(item.toString());
		
		// 1. DB 추가하기
		int ret = mapper.itemInsertOne(item);
		
		// 2. 적절한 페이지로 이동
		if(ret==1) {
			// 절대 경로를 이용한 페이지 이동
			response.sendRedirect(request.getContextPath()+"/item"+"/select.do");
			// 상대 경로를 이용한 페이지 이동
			// response.sendRedirect("select.do");
		}
		else {
			// 상대 경로를 이용한 페이지 이동
			response.sendRedirect("write.do");
		}
	
	}

}
