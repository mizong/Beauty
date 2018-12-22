package ee.coding.beauty.query;

import ee.coding.beauty.util.TimeUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QueryObject {

	private Integer currentPage = 1;
	private Integer pageSize = 10;
	private Integer currentTime = TimeUtil.getHourTimeStamp();

	public int getBeginIndex() {
		return (currentPage - 1) * pageSize;
	}

	protected String empty2null(String str) {
		return str == "" ? null : str;
	}
}
