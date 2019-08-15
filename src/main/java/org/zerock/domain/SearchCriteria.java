package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class SearchCriteria extends Criteria { //Criteria를 상속하기 때문에 Criteria의 속성을 가져다 사용할 수 있음.
	
	private String searchType;
	private String keyword;
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		try {
			this.keyword = URLDecoder.decode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public String toString() {
		return super.toString()+
				"SearchCriteria [searchType="+searchType+","+"keyword"+keyword+"]";
	}
	
	
	
	
}
