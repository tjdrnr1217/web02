package item;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Item;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/item/imageUpdate.do"})
@MultipartConfig(
		fileSizeThreshold = 1024*1024*1, // 1M
		maxFileSize = 1024*1024*10, // 10M
		maxRequestSize = 1024*1024*100 // 100M
)
public class ItemImageUpdateSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		
		long imageNo = Long.parseLong(request.getParameter("imageNo")); // 이미지번호
		Part file = request.getPart("file"); // 첨부한 파일
		long ino = Long.parseLong(request.getParameter("ino")); // 이미지번호
		
		if(file.getSize() > 0) { //첨부가 되었다면 수정
			// mapper를 이용해서 삭제
			ItemImage obj = new ItemImage();
			obj.setNo(imageNo);
			obj.setItemno(ino);
			obj.setFilename(file.getSubmittedFileName());
			obj.setFiletype(file.getContentType());
			obj.setFilesize(file.getSize());
			obj.setFiledata(file.getInputStream().readAllBytes());
			
			int ret = mapper.updateItemImage(obj);
			
			if(ret == 1) { // 변겨완료
				request.setAttribute("message","변경완료 했습니다." );
				request.setAttribute("url","imagewrite.do?ino="+ino );
				request.getRequestDispatcher("/WEB-INF/item/alert.jsp").forward(request, response);
			}
			else { //변경완료 안됨
				request.setAttribute("message","변경 실패" );
				request.setAttribute("url","imagewrite.do?ino="+ino );
				response.sendRedirect("imagewrite.do?ino="+ino);
			}
		}
	}

}
