package ee.coding.beauty.util;

import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.springframework.web.servlet.ModelAndView;

public class AlbumUtil {
	
	private AlbumUtil() {
		
	}
	
	private static Map<String, String> map;
	
	static{
		map = new HashMap<String, String>();
		Properties p = new Properties();
		try {
			p.load(new InputStreamReader(
					Thread.currentThread().getContextClassLoader().getResourceAsStream("my.properties"), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Set<Entry<Object, Object>> entrySet = p.entrySet();
		for (Entry<Object, Object> entry : entrySet) {
			map.put(entry.getKey().toString(), entry.getValue().toString());
		}
	}

	public static void setCategory2MV(ModelAndView mv) {
		mv.addAllObjects(map);
	}

	public static ModelAndView getMV() {
		ModelAndView mv = new ModelAndView();
		AlbumUtil.setCategory2MV(mv);
		return mv;
	}

}