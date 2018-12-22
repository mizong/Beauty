package ee.coding.beauty.service;

import ee.coding.beauty.domain.Content;
import ee.coding.beauty.page.PageResult;
import ee.coding.beauty.query.QueryObject;

public interface IContentService {

	void save(Content content);

	void delete(Integer cid);

	void update(Content content);

	Content get(Integer cid, Integer currentTime);

	PageResult pageQuery(QueryObject qo);

	void saveContentCategoryRelationship(Integer cid, Integer categoryMid);

	void saveContentTagRelationship(Integer cid, Integer mid);

	Integer getTotalCount(QueryObject qo);

}
