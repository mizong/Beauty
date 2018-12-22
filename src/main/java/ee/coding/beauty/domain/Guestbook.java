package ee.coding.beauty.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Guestbook {
	
	// guest id
	private Integer gid;
	// guest's message
	private String message;
	// guest's QQ number or eMail
	private String qMail;
	// submit time
	private Date datetime;

}
