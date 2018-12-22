package ee.coding.beauty.service;

import java.util.List;

import ee.coding.beauty.domain.Meta;

public interface IMetaService {

	void save(Meta meta);

	void delete(Integer id);

	void update(Meta meta);

	Meta get(Integer id);

	List<Meta> list();

	Meta getByTagName(String tagName);

	List<String> getTagNamesByCid(Integer cid);

	String getNameBySlug(String categorySlug);

}
