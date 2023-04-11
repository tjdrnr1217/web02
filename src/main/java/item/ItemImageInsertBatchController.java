package item;

import java.io.IOException;
import java.util.Collection;

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

@WebServlet(urlPatterns = {"/item/imagewritebatch.do"})
@MultipartConfig(
		fileSizeThreshold = 1024*1024*1, // 1M
		maxFileSize = 1024*1024*10, // 10M
		maxRequestSize = 1024*1024*100 // 100M
)
public class ItemImageInsertBatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ItemImageInsertBatchController() {
       
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 게시글 번호
			long ino = Long.parseLong(request.getParameter("ino"));
			
			Collection<Part> partlist = request.getParts();
			
			for(Part part : partlist ) {
				// name 값이 files 인것만 필터
				if(part.getName().equals("file[]")) {
					
					ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
					ItemImage itemimage = new ItemImage();
					itemimage.setItemno(ino);
					itemimage.setFiledata(part.getInputStream().readAllBytes());
					itemimage.setFiletype(part.getContentType());
					itemimage.setFilename(part.getSubmittedFileName());
					itemimage.setFilesize(part.getSize());
					
					// 여기서 mapper로 insert 수행
					// insert all 한번에 추가하는게 좋음
					int ret = mapper.itemimageInsertOne(itemimage);
				}
				
			}
			
			response.sendRedirect("imagewrite.do?ino="+ino);
			
			
	}
	
	// get(조회기능), post(추가의기능), delete(삭제의기능), put(수정의 기능), patch(일부의 수정 기능)
}
