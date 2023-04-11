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

@WebServlet(urlPatterns = {"/item/imagedelete.do"})
public class ItemImageDeleteSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long ino1 = Long.parseLong(request.getParameter("ino1"));
		long imageno = Long.parseLong(request.getParameter("imageno")); //obj.no
	
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		int ret = mapper.itemImageDelete(imageno);
			
		if(ret == 1) {
			response.sendRedirect(request.getContextPath() + "/item"+"/imagewrite.do?ino="+ino1);
		}
		else {
			response.sendRedirect("imagewtite.do?ino="+ino1);
		}
	}

}
