package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Member;

@Mapper
public interface MemberMapper {
	
	@Select({
		" SELECT COUNT(*) cnt FROM member WHERE id=#{id}"
	})
	public int selectMemberIDCheck(@Param("id") String id);
	
	@Select({
		" SELECT m.id, m.name, m.age FROM member m",
		" WHERE ID=#{obj.id} AND PASSWORD=#{obj.password}"
	})
	public Member selectMemberLogin(@Param("obj") Member obj);
}
