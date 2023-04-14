package dto;

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
public class PurchaseView {
	private String iname;
	private long price;
	private String name;
	private long no;
	private long cnt;
	private long itemno;
	private String customerid;
	private Date regdate;
	
}
