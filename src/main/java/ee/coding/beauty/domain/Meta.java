package ee.coding.beauty.domain;

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
public class Meta {
	
	// meta id
	private Integer mid;
	// meta name
	private String name;
	// meta type: category/tag
	private String type;
	// abbreviations of meta, for path
	private String slug;

}
