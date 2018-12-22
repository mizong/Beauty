package ee.coding.beauty.page;

import java.util.Collections;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageResult {

	private Integer currentPage;
	private Integer pageSize;
	private Integer prePage;
	private Integer nextPage;
	private Integer totalPage;
	private Integer totalCount;
	private List<?> data;

	public static final PageResult emptyResult = new PageResult(1, 10, 0, Collections.EMPTY_LIST);

	public PageResult(Integer currentPage, Integer pageSize, Integer totalCount, List<?> data) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.data = data;
		totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
		prePage = currentPage > 1 ? currentPage - 1 : 1;
		nextPage = currentPage < totalPage ? currentPage + 1 : totalPage;
	}
}
