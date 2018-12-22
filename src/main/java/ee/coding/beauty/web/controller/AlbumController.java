package ee.coding.beauty.web.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ee.coding.beauty.domain.Content;
import ee.coding.beauty.page.PageResult;
import ee.coding.beauty.query.ContentQueryObject;
import ee.coding.beauty.service.IContentService;
import ee.coding.beauty.service.IMetaService;
import ee.coding.beauty.util.AlbumUtil;
import ee.coding.beauty.util.CacheUtil;
import ee.coding.beauty.util.TimeUtil;
import ee.coding.beauty.util.ViewNameUtil;

@Controller
public class AlbumController {

	@Autowired
	private IContentService contentService;

	@Autowired
	private IMetaService metaService;

	@SuppressWarnings("deprecation")
	@RequestMapping("/")
	public ModelAndView main(HttpServletRequest request, ContentQueryObject qo) throws Exception {
		Map<String, ModelAndView> keyMVMap = CacheUtil.getKeyMVMap();
		ModelAndView mv = AlbumUtil.getMV();
		// append key
		String tag = "";
		String referer = request.getHeader("referer");
		if (qo.getKeyword() != null && qo.getKeyword() != "") {
			mv.addObject("keyword", qo.getKeyword());
		} else if (referer != null) {
			referer = URLDecoder.decode(referer);
			if (referer.contains("tag")) {
				tag = referer.substring(referer.lastIndexOf("/") + 1);
				qo.setKeyword(tag);
				mv.addObject("keyword", tag);
			}
		}
		// String device = DeviceUtil.isMoblie(request) ? "true" : "false";
		String key = "main" + ViewNameUtil.isMoblie(request) + tag + qo.toString();
		if (keyMVMap.containsKey(key)) {
			return keyMVMap.get(key);
		} else {
			// if cache doesn't exist, query and add
			PageResult result = contentService.pageQuery(qo);
			mv.addObject("result", result);
			ViewNameUtil.setViewName(request, mv, "index");
			keyMVMap.put(key, mv);
			return mv;
		}
	}

	@RequestMapping("/tag/{tagName}")
	// get album by tag name
	public ModelAndView getByTag(@PathVariable("tagName") String keyword, HttpServletRequest request) throws Exception {
		Map<String, ModelAndView> keyMVMap = CacheUtil.getKeyMVMap();
		String key = "tag" + ViewNameUtil.isMoblie(request) + keyword + TimeUtil.getHourTimeStamp();
		if (keyMVMap.containsKey(key)) {
			return keyMVMap.get(key);
		}
		keyword = new String(keyword.getBytes("iso-8859-1"), "utf-8");
		ModelAndView mv = AlbumUtil.getMV();
		ContentQueryObject qo = new ContentQueryObject();
		qo.setKeyword(keyword);
		PageResult result = contentService.pageQuery(qo);
		mv.addObject("result", result);
		ViewNameUtil.setViewName(request, mv, "index");
		keyMVMap.put(key, mv);
		return mv;
	}

	@RequestMapping("/random/")
	public ModelAndView getRandomAlbum(HttpServletRequest request, ContentQueryObject qo) throws Exception {
		Random random = new Random();
		Set<Content> randomContentSet = CacheUtil.getRandomContent(contentService, random);
		ModelAndView mv = AlbumUtil.getMV();
		mv.addObject("content", (Content) randomContentSet.toArray()[random.nextInt(30)]);
		ViewNameUtil.setViewName(request, mv, "random");
		return mv;
	}

	@RequestMapping("/{categorySlug}")
	// get album by category
	public ModelAndView getByCategory(@PathVariable("categorySlug") String categorySlug, HttpServletRequest request,
			ContentQueryObject qo) throws Exception {
		Map<String, ModelAndView> keyMVMap = CacheUtil.getKeyMVMap();
		String key = "category" + ViewNameUtil.isMoblie(request) + categorySlug + qo.toString();
		if (keyMVMap.containsKey(key)) {
			return keyMVMap.get(key);
		}
		ModelAndView mv = AlbumUtil.getMV();
		qo.setCategorySlug(categorySlug);
		PageResult result = contentService.pageQuery(qo);
		mv.addObject("result", result);
		String categoryName = metaService.getNameBySlug(categorySlug);
		mv.addObject("categorySlug", categorySlug);
		mv.addObject("categoryName", categoryName);
		ViewNameUtil.setViewName(request, mv, "index");
		keyMVMap.put(key, mv);
		return mv;
	}

	@RequestMapping("/{categorySlug}/{cid}.html")
	// get album by cid, at the same time get 6 albums by tag/category
	public ModelAndView getByCid(@PathVariable("cid") Integer cid, HttpServletRequest request) throws Exception {
		Map<String, ModelAndView> keyMVMap = CacheUtil.getKeyMVMap();
		String key = "cid" + ViewNameUtil.isMoblie(request) + cid + TimeUtil.getHourTimeStamp().toString();
		if (keyMVMap.containsKey(key)) {
			return keyMVMap.get(key);
		}
		ModelAndView mv = AlbumUtil.getMV();
		Content content = contentService.get(cid, TimeUtil.getHourTimeStamp());
		if (content == null) {
			ViewNameUtil.setViewName(request, mv, "404page");
			keyMVMap.put(key, mv);
			return mv;
		}
		mv.addObject("content", content);
		Integer contentCid = content.getCid();
		List<String> tagList = content.getTagList();
		List<Content> contentList = new ArrayList<>();
		for (String tag : tagList) {
			if (contentList.size() == 6) {
				// if we get 6 albums, then break the loop
				break;
			}
			ContentQueryObject qo = new ContentQueryObject();
			qo.setKeyword(tag);
			qo.setCurrentPage(1);
			qo.setPageSize(7);
			@SuppressWarnings("unchecked")
			List<Content> data = (List<Content>) contentService.pageQuery(qo).getData();
			for (Content cont : data) {
				List<Content> copyContentList = new ArrayList<>();
				copyContentList.addAll(contentList);
				if (cont.getCid().equals(contentCid)) {
					continue;
				}
				Boolean flag = true;
				for (Content cil : copyContentList) {
					if (cont.getCid().equals(cil.getCid())) {
						flag = false;
						continue;
					}
				}
				if (flag) {
					contentList.add(cont);
					if (contentList.size() == 6) {
						break;
					}
				}
			}
		}
		// if we get less than 6 albums by tag, then get more by category
		if (contentList.size() < 6) {
			ContentQueryObject qo = new ContentQueryObject();
			qo.setCategorySlug(content.getCategorySlug());
			qo.setCurrentPage(1);
			qo.setPageSize(7);
			@SuppressWarnings("unchecked")
			List<Content> data = (List<Content>) contentService.pageQuery(qo).getData();
			for (Content cont : data) {
				List<Content> copyContentList = new ArrayList<>();
				copyContentList.addAll(contentList);
				if (cont.getCid().equals(contentCid)) {
					continue;
				}
				Boolean flag = true;
				for (Content cil : copyContentList) {
					if (cont.getCid().equals(cil.getCid())) {
						flag = false;
						continue;
					}
				}
				if (flag) {
					contentList.add(cont);
					if (contentList.size() == 6) {
						break;
					}
				}
			}
		}
		mv.addObject("contentList", contentList);
		mv.addObject("totalCount", contentService.getTotalCount(new ContentQueryObject()));
		ViewNameUtil.setViewName(request, mv, "album");
		keyMVMap.put(key, mv);
		return mv;
	}

}