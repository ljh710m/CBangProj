package util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	
	private static final String path = "/";
	
	/**
	  * @description 특정 key의 쿠키값을 List로 반환한다.
	  * @params key: 쿠키 이름
	  */
	public List<String> getValueList(String key, HttpServletRequest request) throws UnsupportedEncodingException{
		Cookie[] cookies = request.getCookies();
		String[] cookieValues = null;
		String value = "";
		List<String> list = null;
		
		// 특정 key의 쿠키값을 ","로 구분하여 String 배열에 담아준다.
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals(key)){
					value = cookies[i].getValue();
					cookieValues = value.split(",");
					break;
				}
			}
		}
		
		// String 배열에 담겼던 값들을 List로 다시 담는다.
		if(cookieValues != null){
			list = new ArrayList<String>(Arrays.asList(cookieValues));
			
			/*if (list.size() > 3) { // 값이 3개를 초과하면, 최근 것 3개만 담는다.
				int start = list.size() - 3;
			    List<String> copyList = new ArrayList<String>();
			    for (int i = start ; i < list.size() ; i++) {
			    	copyList.add(list.get(i));
			    }
			    list = copyList;
			}*/
		}		
		
		return list;
	}
		
	/**
	 * @description 쿠키를 생성 혹은 업데이트한다.
	 * @params key: 쿠키 이름, value: 쿠키 이름과 짝을 이루는 값, day: 쿠키의 수명
	 */
	public void setCookie(String key, String value, int day, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		List<String> list = getValueList(key, request);
		String sumValue = "";
		int equalsValueCnt = 0;
		
		if(list != null){
			for(int i=0; i<list.size(); i++){
				sumValue += list.get(i) + ",";
			    if(list.get(i).equals(value)){
			    	equalsValueCnt++;
			    }
			}
			if(equalsValueCnt != 0){ // 같은 값을 넣으려고 할 때의 처리
				if(sumValue.substring(sumValue.length()-1).equals(",")){
					sumValue = sumValue.substring(0, sumValue.length()-1);
			    }
			}
			else { // 값은 값이 없을 경우
				sumValue += value;
			}
		}
		else { // 기존의 쿠키가 없을 경우
			sumValue = value;
		}
		
		if(!sumValue.equals("")){
			Cookie cookie = new Cookie("visited", sumValue);
			cookie.setMaxAge(60);//초단위, 일단위 : 60*60*24*day
			cookie.setPath(path);
			response.addCookie(cookie);			
		}
	}

}
