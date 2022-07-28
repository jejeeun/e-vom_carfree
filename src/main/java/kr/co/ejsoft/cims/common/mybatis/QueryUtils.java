package kr.co.ejsoft.cims.common.mybatis;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Map;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-02
 */
public class QueryUtils {
	/**
	 * object 변수 empty 체크
	 * @param object
	 * @return
	 */
	public static Boolean isEmpty(Object object) {
		if (object instanceof String) {
			return StringUtils.isEmpty((String) object);
		} else if (object instanceof List) {
			return CollectionUtils.isEmpty((List) object);
		} else if (object instanceof Map) {
			return MapUtils.isEmpty((Map) object);
		} else if (object instanceof Object[]) {
			return Array.getLength(object) == 0;
		} else {
			return object == null;
		}
	}

	public static Boolean isNotEmpty(Object object) {
		return !isEmpty(object);
	}

	public static String makeDateTimeFormat(String string) {
		String dateTime = string.replaceAll("[.]|[-]|[:]| ", "");
		return StringUtils.rightPad(dateTime, 14, "0");
	}

	public static String makeDateFormat(String string) {
		return string.replaceAll("[.]|[-]|[:]| ", "");
	}
}
