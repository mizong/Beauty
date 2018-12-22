package ee.coding.beauty.mapper;

import java.util.List;

import ee.coding.beauty.domain.Meta;

public interface MetaMapper {

	void save(Meta tag);

	void delete(Integer mid);

	void update(Meta tag);

	Meta get(Integer mid);

	List<Meta> list();

	Meta getByTagName(String tagName);

	List<String> getTagNamesByCid(Integer cid);

	String getNameBySlug(String categorySlug);

}
