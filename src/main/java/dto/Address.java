package dto;
//2023.04.06
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Address {
	private long no;
	private String postcode;
	private String address;
	private String memberid;
	private Date regdate;

}
