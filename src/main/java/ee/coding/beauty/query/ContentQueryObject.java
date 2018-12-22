package ee.coding.beauty.query;

import lombok.Setter;

@Setter
public class ContentQueryObject extends QueryObject {

	private String keyword;

	private String categorySlug;

	public String getKeyword() {
		return empty2null(keyword);
	}

	public String getCategorySlug() {
		return empty2null(categorySlug);
	}

	@Override
	public String toString() {
		return "ContentQueryObject [keyword=" + keyword + ", categorySlug=" + categorySlug + ", toString()="
				+ super.toString() + "]";
	}

}
