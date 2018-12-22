package ee.coding.beauty.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ee.coding.beauty.domain.Content;
import ee.coding.beauty.query.QueryObject;

public interface ContentMapper {

	void save(Content content);

	void delete(Integer cid);

	void update(Content content);

	Content get(@Param("cid") Integer cid, @Param("currentTime") Integer currentTime);

	void saveContentCategoryRelationship(@Param("cid") Integer cid, @Param("categoryMid") Integer categoryMid);

	void saveContentTagRelationship(@Param("cid") Integer cid, @Param("tagMid") Integer mid);

	List<Content> getListData(QueryObject qo);

	Integer getTotalCount(QueryObject qo);

}
