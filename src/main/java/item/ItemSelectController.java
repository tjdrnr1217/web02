package item;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/item/select.do"})
public class ItemSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ItemSelectController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		String page = request.getParameter("page");
		
		if(page == null) {
			response.sendRedirect("select.do?page=1");
			return;
		}
		int start = Integer.parseInt(page)*10-9;
		int end = Integer.parseInt(page)*10;
		
		List<Item> item = mapper.selectItemList(start, end);
		
		long cnt = mapper.countitemList();

		request.setAttribute("item", item);
		request.setAttribute("pages", (cnt-1) / 10+1);
		
		
		request.getRequestDispatcher("/WEB-INF/item/item_select.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

}
