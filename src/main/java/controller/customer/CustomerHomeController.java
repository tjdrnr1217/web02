package controller.customer;

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

@WebServlet(urlPatterns = {"/customer/home.do"})
public class CustomerHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CustomerHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("aaaaa");
		List<Item> list = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemListAll();
		
		// " SELECT NVL (min(no),0) FROM itemimage WHERE itemno < #{no}"
		for(Item obj : list) {
			// mapper를 호출하여 해당물품의 가장먼저등록했던 이미지번호 1개를 가져옴.
			long imageNo = MyBatisContext.getSqlSession().
					getMapper(ItemMapper.class).
					selectItmeImageOne(obj.getNo());
			obj.setImageNo(imageNo);
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/member/customer_home.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
	}

}
