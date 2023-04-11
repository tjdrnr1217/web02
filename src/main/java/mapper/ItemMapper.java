package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Item;
import dto.ItemImage;

@Mapper
public interface ItemMapper {
	
	// #{} => 값을 표현
	// ${} => 컬럼명, 테이블명 등.
	@Select({
		" SELECT COUNT(*) cnt FROM item "
	})
	public long countitemList();
	@Insert({
		" INSERT INTO item(no,name,content,price,quantity,regdate) ",
		" VALUES(SEQ_ITEM_NO.NEXTVAL,#{obj.name},#{obj.content},#{obj.price},#{obj.quantity},CURRENT_TIMESTAMP) "
	})
	public int itemInsertOne(@Param("obj")Item item);
	
	@Select({
		" SELECT b.* FROM ",
		" (SELECT b.*,ROW_NUMBER() OVER (ORDER BY no DESC) rown FROM item b ",
		" )b WHERE rown >= #{start} AND rown <= #{end} ORDER BY no DESC "
	})
	public List<Item> selectItemList(@Param("start") int page, @Param("end") int end);
	
	@Select({
		" SELECT * FROM item WHERE ${column} LIKE '%' || #{text} || '%' ORDER BY no DESC "
	})
	public List<Item> itemSelectList(@Param("column") String column, @Param("text") String text);
	
	@Insert({
		" INSERT INTO itemimage(no,filename,filedata,filetype,filesize,itemno,regdate) ",
		" VALUES(SEQ_ITEMIMAGE_NO.NEXTVAL,#{obj.filename},#{obj.filedata},#{obj.filetype},#{obj.filesize},#{obj.itemno},CURRENT_TIMESTAMP) "
	})
	public int itemimageInsertOne(@Param("obj")ItemImage itemimage );
	// 이미지 1개 가져오기
	@Select({
		" SELECT i.* FROM itemimage i WHERE NO=#{no} "
	})
	public ItemImage selectItemImageOne(@Param("no") long no);
	
	// 물품번호를 이용해서 관련된 전체 이미지번호 반환
	@Select({
		" SELECT no from itemimage WHERE itemno = #{itemno} "
	})
	public List<ItemImage> selectItemno(@Param("itemno") long no);
	@Delete({
		" DELETE FROM itemimage WHERE no = #{no} "
	})
	public int itemImageDelete(@Param("no") long no);
	@Update({
		" UPDATE itemimage SET filename = #{obj.filename}, filedata = #{obj.filedata}, filetype = #{obj.filetype}, filesize = #{obj.filesize} ",
		" WHERE no = #{obj.no} "
	})
	public int updateItemImage(@Param("obj") ItemImage itemimage);
}
