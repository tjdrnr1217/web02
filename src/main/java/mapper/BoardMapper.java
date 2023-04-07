package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Board;

@Mapper
public interface BoardMapper {
	
	// insert, update, delete => int
	// select => list, object int ... 다양함.
	
	// 조회수증가(글번호가 오면 해당 글번호 조회수만 1증가)
	@Update({
		" UPDATE board SET hit=hit+1 WHERE no= #{no} "
	})
	public int updateBoardHit(@Param("no") long no);
	
	@Insert({
		" INSERT INTO board(title, content, writer) ",
		" VALUES (#{obj.title},#{obj.content},#{obj.writer}) "
	})
	public int insertBoardOne(@Param("obj") Board obj);
	
	@Select({
		" SELECT * FROM board ORDER BY no DESC "
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
	
	@Select({
		" SELECT * FROM board WHERE no = #{no}"
	})
	public Board selectOneBoard(@Param("no") long no);
	
	@Select({
		" SELECT NVL (max(no),0) FROM board WHERE NO < #{no}"
	})
	public long selectPrevBoardOne(@Param("no") long no);
	
	@Select({
		" SELECT NVL (MIN(no),0) FROM board WHERE no > #{no}"
	})
	public long selectNextBoardOne(@Param("no") long no);
	
	@Delete({
		" DELETE FROM board WHERE no = #{no} "
	})
	public int deleteBoard(@Param("no") int no );
	
	@Update({
		" UPDATE board SET title=#{obj.title}, content = #{content} WHERE no = #{obj.no} "
	})
	public int updateBoard(@Param("obj") Board obj);
}
