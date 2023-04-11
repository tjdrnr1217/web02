package item;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mapper.ItemMapper;


@WebServlet(urlPatterns = {"/item/imagewrite.do"})

@MultipartConfig(
		fileSizeThreshold = 1024*1024*1, // 1M
		maxFileSize = 1024*1024*10, // 10M
		maxRequestSize = 1024*1024*100 // 100M
)
public class ItemImageinsertImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 주소창의 물품번호 가져오기
		request.setAttribute("title", "물품이미지1개등록");
		long ino = Long.parseLong(request.getParameter("ino"));
		request.setAttribute("ino", ino); // ${param.itemno}
		
		// 2.물품번호에 해당하는 이미지들
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		List<ItemImage> itemno = mapper.selectItemno(ino);
		request.setAttribute("itemno", itemno);
		// 3. view 표시
		request.getRequestDispatcher("/WEB-INF/item/item_image_write.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long ino = Long.parseLong(request.getParameter("ino"));
		Part part = request.getPart("file");
		
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		
		ItemImage obj = new ItemImage();
		obj.setItemno(ino); // 물품 번호
		obj.setFilename(part.getSubmittedFileName()); // 첨부한 파일명
		obj.setFilesize(part.getSize()); // 첨부한 파일크기
		obj.setFiletype(part.getContentType()); // 첨부한 파일 종류, gif, jpg, png....
		obj.setFiledata(part.getInputStream().readAllBytes()); // 첨부한 파일 실제 데이터
		
		int ret = mapper.itemimageInsertOne(obj);
		
		if(ret==1) {
			response.sendRedirect("imagewrite.do?ino="+ino);
		}
		else {
			response.sendRedirect("insertimageone.do?itemno="+ino);
		}
		
	}

}
