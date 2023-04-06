package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Board;

@Mapper
public interface BoardMapper {
	@Insert({
		" INSERT INTO board(title, content, writer) ",
		" VALUES (#{obj.title},#{obj.content},#{obj.writer}) "
	})
	public int insertBoardOne(@Param("obj") Board obj);
	
	@Select({
		" SELECT * FROM board ORDER BY no asc "
	})
	public List<Board> selectBoardList();
	
	@Select({
		" Select count(*) cnt FROM board "
	})
	public long countBoardList();
	
	@Select({
		" SELECT b.* FROM( ",
		" SELECT b.*,ROW_NUMBER() OVER (ORDER BY no DESC) rown FROM board b ",
		" ) b WHERE rown >= #{start} AND rown <= #{end} ORDER BY no DESC "
	})
	public List<Board> selectBoardListPage(
			@Param("start") int start, @Param("end") int end);
}
