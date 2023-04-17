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
	private long no;
	private long cnt;
	private Date regdate;
	private String customerid;
	private String customername;
	private long itemno;
	private String itemname;
	private long itemprice;
	
}
