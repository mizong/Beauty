package ee.coding.beauty.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ee.coding.beauty.domain.Guestbook;
import ee.coding.beauty.service.IGuestbookService;
import ee.coding.beauty.util.AlbumUtil;
import ee.coding.beauty.util.ViewNameUtil;

@Controller
public class GuestbookController {

	@Autowired
	private IGuestbookService guestbookService;

	@RequestMapping("/guestbook")
	// check whether there's an error message or not, then redirect to guest page
	public ModelAndView guest(HttpServletRequest request, String go) throws Exception {
		ModelAndView mv = AlbumUtil.getMV();
		if (go != null && go.equals("err")) {
			String referer = request.getHeader("referer");
			mv.addObject("referer", referer);
		}
		ViewNameUtil.setViewName(request, mv, "guestbook");
		return mv;
	}

	@RequestMapping("/guest")
	// save guest's message
	public ModelAndView saveMessage(Guestbook guestbook, HttpServletRequest request) throws Exception {
		ModelAndView mv = AlbumUtil.getMV();
		guestbook.setDatetime(new Date());
		guestbookService.save(guestbook);
		ViewNameUtil.setViewName(request, mv, "tips");
		return mv;
	}

}
