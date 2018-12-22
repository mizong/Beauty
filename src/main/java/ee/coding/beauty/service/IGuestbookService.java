package ee.coding.beauty.service;

import java.util.List;

import ee.coding.beauty.domain.Guestbook;

public interface IGuestbookService {

	void save(Guestbook guestbook);

	void delete(Integer cid);

	void update(Guestbook guestbook);

	Guestbook get(Integer cid);

	List<Guestbook> list();

}
