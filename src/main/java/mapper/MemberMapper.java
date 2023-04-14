package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Member;
import lombok.experimental.PackagePrivate;

@Mapper
public interface MemberMapper {
	
	@Delete({
		"DELETE FROM member WHERE id = #{obj.id} AND password = #{obj.password}"
	})
	public int deleteMemberOne(@Param("obj") Member obj );
	
	@Update({
		" UPDATE member SET password = #{obj.password1} WHERE id = #{obj.id} AND password = #{obj.password}"
	})
	public int updatepasswordMemberOne(@Param("obj") Member obj);
	
	@Update({
		" UPDATE member SET name = #{obj.name}, age = #{obj.age} WHERE id = #{obj.id}"
	})
	public int updateMemberone(@Param("obj") Member obj);
	
	@Select({
		" SELECT id, name, age FROM member WHERE id=#{id} "
	})
	public Member selectMemberOne(@Param("id") String id);
	
	@Select({
		" SELECT id, role, name, age, regdate FROM member WHERE id=#{obj.id} AND password = #{obj.password}"
	})
	public Member LoginMember(@Param("obj") Member obj);
	
	@Insert({
		" INSERT INTO member ( id, password, name, age, role) ",
		" VALUES(#{obj.id},#{obj.password},#{obj.name},#{obj.age}, #{obj.role}) "
	})
	public int insertMemberOne(@Param("obj") Member id);

	
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
