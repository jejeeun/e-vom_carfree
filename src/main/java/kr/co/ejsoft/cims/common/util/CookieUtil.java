package kr.co.ejsoft.cims.common.util;

import org.apache.commons.lang3.ArrayUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Optional;

/**
 * User: Naeyoung Kim
 * Date: 2019-01-17
 */
public class CookieUtil {
	public static Optional<String> getCookieValue(Cookie[] cookies, String name) {
		if (ArrayUtils.isEmpty(cookies)) {
			return Optional.empty();
		}

		return Arrays.stream(cookies)
				.filter(cookie -> name.equals(cookie.getName()))
				.findAny()
				.map(Cookie::getValue);
	}

	public static void addCookie(HttpServletResponse response, String name, String value) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
}