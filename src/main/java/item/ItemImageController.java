package item;

import java.io.IOException;

import config.MyBatisContext;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemMapper;

// 컨트롤러X, DB의 이미지르 url형태로 변경해서 반환

// jsp에서 src에 이미지의 위치를 설정하는 용도로 사용
// <img src="/itme/image?no=아이템번호" style="width:60px; height:60px"/>

// 크롭에서 http://127.0.0.1:8080/web02/item/image?no=1003확인
@WebServlet(urlPatterns = {"/item/image"})
public class ItemImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemImageController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long no = Long.parseLong(request.getParameter("no"));
		// no를 전달하여 mapper에서 itemimage정보 1개 가져옴.
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		ItemImage itemimage = mapper.selectItemImageOne(no);
		
		response.setContentType(itemimage.getFiletype()); // 이건 이미지다. html이 아니다
		response.setStatus(200); // 200은 정상적인 처리 결과다.
		response.getOutputStream().write(itemimage.getFiledata()); // 이게 실제 정보	
	}
}
