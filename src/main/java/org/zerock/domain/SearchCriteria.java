package org.zerock.domain;

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
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return super.toString()+
				"SearchCriteria [searchType="+searchType+","+"keyword"+keyword+"]";
	}
	
	
	
	
}
