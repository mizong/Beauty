package ee.coding.beauty.util;

public class TimeUtil {

	private TimeUtil() {

	}

	// 8 hours' time stamp
	public static Integer getHourTimeStamp() {
		int currentTimeMillis = (int) (System.currentTimeMillis() / 1000);
		return currentTimeMillis - currentTimeMillis % (3600 * 8);
	}

}
