package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Purchase;
import dto.PurchaseView;

@Mapper
public interface PurchaseMapper {
	
	// 회원별 주문수량 합계
	@Select({
		" SELECT customerid, SUM(cnt) cnt FROM purchase GROUP BY customerid "
	})
	public List<Map<String,Object> > selectMemberGroup();
	
	//삭제하기
	@Delete({ // delete controller에서 chk가 배열로 지정되어있기때문에 반복문을 사용해야한다(foreach는 배열을 반복할때 사용)
		"<script>",
		"DELETE FROM purchase WHERE customerid=#{map.id} AND no IN( ",
			"<foreach collection='map.chk' item='tmp' separator=','>",
				"#{tmp}",
			"</foreach>",
		") ",
		"</script>"
	})
	// DELETE FROM 테이블명 WHERE customerid = 'a' AND no (1,2,3,4);
	public int deletePurchase(@Param("map") Map<String, Object> map);
	
	// 주문하기
	@Insert({
		" INSERT INTO purchase(cnt, itemno, customerid) ",
		" VALUES(#{obj.cnt}, #{obj.itemno}, #{obj.customerid})"
	})
	public int insertPurchaseOne(@Param("obj") Purchase obj);
	
	// 현재 로그인한 사용자가 주문한 내역 조회
	@Select({
		" SELECT p.* FROM purchase p WHERE customerid=#{id}"
	})
	public List<Purchase> selectPurchaseMember(@Param("id") String id);
	
	// 주문 + 고객 + 물품을 조인한 view만들기
	// 주문번호, 주문수량, 주문일자, 주문자아이디, 주문자이름, 물품명, 물품가격
	@Select({
		" SELECT pv.* FROM purchaseview pv WHERE  customerid=#{id}"
	})
	public List<PurchaseView> selectPurchaseViewMember(@Param("id") String id);

}
