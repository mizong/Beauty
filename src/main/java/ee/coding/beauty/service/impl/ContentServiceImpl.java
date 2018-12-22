package ee.coding.beauty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ee.coding.beauty.domain.Content;
import ee.coding.beauty.mapper.ContentMapper;
import ee.coding.beauty.page.PageResult;
import ee.coding.beauty.query.QueryObject;
import ee.coding.beauty.service.IContentService;

@Service
public class ContentServiceImpl implements IContentService {

	@Autowired
	private ContentMapper contentMapper;

	@Override
	public void save(Content content) {
		contentMapper.save(content);
	}

	@Override
	public void delete(Integer cid) {
		contentMapper.delete(cid);
	}

	@Override
	public void update(Content content) {
		contentMapper.update(content);
	}

	@Override
	public Content get(Integer cid, Integer currentTime) {
		return contentMapper.get(cid, currentTime);
	}

	@Override
	public void saveContentCategoryRelationship(Integer cid, Integer categoryMid) {
		contentMapper.saveContentCategoryRelationship(cid, categoryMid);
	}

	@Override
	public void saveContentTagRelationship(Integer cid, Integer mid) {
		contentMapper.saveContentTagRelationship(cid, mid);
	}

	@Override
	public PageResult pageQuery(QueryObject qo) {
		Integer totalCount = contentMapper.getTotalCount(qo);
		if (totalCount == 0) {
			return PageResult.emptyResult;
		}
		List<Content> listData = contentMapper.getListData(qo);
		return new PageResult(qo.getCurrentPage(), qo.getPageSize(), totalCount.intValue(), listData);
	}

	@Override
	public Integer getTotalCount(QueryObject qo) {
		return contentMapper.getTotalCount(qo);
	}

}
