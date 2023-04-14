package dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude= {"regdate"}) // Tostring으로 출력할때 regdate는 출력하지 않겠다 제외함
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	
	private long no;
	private String name;
	private String content; // clob
	private long price;
	private long quantity;
	private Date regdate;
	
	private long imageNo; // 대표이미지 번호를 저장할 임시변수
	
}
