package ee.coding.beauty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ee.coding.beauty.domain.Guestbook;
import ee.coding.beauty.mapper.GuestbookMapper;
import ee.coding.beauty.service.IGuestbookService;

@Service
public class GuestbookServiceImpl implements IGuestbookService {

	@Autowired
	private GuestbookMapper guestbookMapper;

	@Override
	public void save(Guestbook guestbook) {
		guestbookMapper.save(guestbook);
	}

	@Override
	public void delete(Integer id) {
		guestbookMapper.delete(id);
	}

	@Override
	public void update(Guestbook guestbook) {
		guestbookMapper.update(guestbook);
	}

	@Override
	public Guestbook get(Integer id) {
		return guestbookMapper.get(id);
	}

	@Override
	public List<Guestbook> list() {
		return guestbookMapper.list();
	}

}
