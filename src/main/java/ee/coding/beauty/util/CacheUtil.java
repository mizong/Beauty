package ee.coding.beauty.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.web.servlet.ModelAndView;

import ee.coding.beauty.domain.Content;
import ee.coding.beauty.query.ContentQueryObject;
import ee.coding.beauty.service.IContentService;

public class CacheUtil {
	
	private CacheUtil() {
		
	}

	private static Map<String, ModelAndView> keyMVMap = new HashMap<>();
	private static Map<String, Map<String, ModelAndView>> myCache = new HashMap<>();

	private static Map<String, Set<Content>> randomMap = new HashMap<>();

	public static Map<String, ModelAndView> getKeyMVMap() {
		String timeKey = TimeUtil.getHourTimeStamp().toString();
		keyMVMap = myCache.get(timeKey);
		if (keyMVMap == null) {
			myCache.clear();
			keyMVMap = new HashMap<>();
			myCache.put(timeKey, keyMVMap);
		}
		return keyMVMap;
	}

	public static Set<Content> getRandomContent(IContentService service, Random random) {
		String key = TimeUtil.getHourTimeStamp().toString();
		Set<Content> set = randomMap.get(key);
		if (set == null) {
			randomMap.clear();
			set = new HashSet<>();
			while (set.size() <= 30) {
				set.add(service.get(random.nextInt(service.getTotalCount(new ContentQueryObject())) + 1,
						TimeUtil.getHourTimeStamp()));
			}
			randomMap.put(key, set);
		}
		return set;
	}

}
