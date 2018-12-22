package ee.coding.beauty.mapper;

import java.util.List;

import ee.coding.beauty.domain.Guestbook;

public interface GuestbookMapper {

	void save(Guestbook guestbook);

	void delete(Integer gid);

	void update(Guestbook guestbook);

	Guestbook get(Integer gid);

	List<Guestbook> list();

}
