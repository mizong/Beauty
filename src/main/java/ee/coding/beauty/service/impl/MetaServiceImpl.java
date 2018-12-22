package ee.coding.beauty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ee.coding.beauty.domain.Meta;
import ee.coding.beauty.mapper.MetaMapper;
import ee.coding.beauty.service.IMetaService;

@Service
public class MetaServiceImpl implements IMetaService {

	@Autowired
	private MetaMapper metaMapper;

	@Override
	public void save(Meta meta) {
		metaMapper.save(meta);
	}

	@Override
	public void delete(Integer id) {
		metaMapper.delete(id);
	}

	@Override
	public void update(Meta meta) {
		metaMapper.update(meta);
	}

	@Override
	public Meta get(Integer id) {
		return metaMapper.get(id);
	}

	@Override
	public List<Meta> list() {
		return metaMapper.list();
	}

	@Override
	public Meta getByTagName(String tagName) {
		return metaMapper.getByTagName(tagName);
	}

	@Override
	public List<String> getTagNamesByCid(Integer cid) {
		return metaMapper.getTagNamesByCid(cid);
	}

	@Override
	public String getNameBySlug(String categorySlug) {
		return metaMapper.getNameBySlug(categorySlug);
	}

}
