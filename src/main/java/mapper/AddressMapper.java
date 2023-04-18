package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Address;
@Mapper
public interface AddressMapper {
	@Delete({
		" DELETE FROM address WHERE no=#{obj.no} AND memberid=#{obj.memberid} " 
	})
	public int deleteAddress(@Param("obj") Address obj);
	
	@Select({
		" SELECT * FROM address WHERE memberid = #{id} "
	})
	public List<Address> selectAddress(String id);
	
	@Insert({
		" INSERT INTO address(postcode, address, memberid)",
		" VALUES( #{obj.postcode}, #{obj.address}, #{obj.memberid}) "
	})
	public int insertAddress(@Param("obj") Address obj);
}

