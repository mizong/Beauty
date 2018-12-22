package ee.coding.beauty.domain;

import java.util.ArrayList;
import java.util.List;

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
public class Content {

	// album id
	private Integer cid;
	// album title
	private String title;
	// album path:abcdefjh
	private String path;
	// picture count in an album
	private Integer pictureCount;
	// published time stamp:1523894400
	private Integer timestamp;
	// album category
	private String categoryName;
	// category abbreviations,for path
	private String categorySlug;
	// album keywords, split by ',', for SEO
	private String keywords;
	// month-day time:02-14
	private String mdtime;
	// year-month-day time:2019年02月14日
	private String ymdtime;
	// tag list, from keywords above
	private List<String> tagList = new ArrayList<>();

}
