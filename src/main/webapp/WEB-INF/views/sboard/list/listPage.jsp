<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<%@include file="./header.jsp" %>
	
</head>

<body>
	<header id="header">
		<div class="header-container">
			<h1 class="welecome"><a href="/bbs/sboard/listPage">WELECOME ${login.uid}</a></h1>
				<div class="button-container">
            		<button id="newBtn" class="btn btn-primary btn-icon-split btn-sm">
	                    <span class="icon text-white-50">
	                      <i class="fas fa-check"></i>
	                    </span>
                    	<span class="text">NEWREGISTER</span>
                  	</button>
                  	<button id="logout" class="btn btn-warning btn-icon-split btn-sm">
	                    <span class="icon text-white-50">
	                      <i class="fas fa-check"></i>
	                    </span>
                    <span class="text">LOGOUT</span>
                  	</button>
				</div>
		</div>
	</header>
	
	<hr>
	
	<section id="contents">
		<article>
         
	 	<div class="contents-container">
			<div class="search-option">
				<div class="input-group-append">
					<select name='searchType' class="btn btn-light btn-icon-split">
						<option value="t"<c:out value="${pageMaker.cri.searchType == null?'selected':''}"/>>--</option>
						<option value="t"<c:out value="${pageMaker.cri.searchType eq 't'?'selected':''}"/>>제목</option>				
						<option value="c"<c:out value="${pageMaker.cri.searchType eq 'c'?'selected':''}"/>>내용</option>			
						<option value="w"<c:out value="${pageMaker.cri.searchType eq 'w'?'selected':''}"/>>작성자</option>									
						<option value="tc"<c:out value="${pageMaker.cri.searchType eq 'tc'?'selected':''}"/>>제목or 내용</option>								
						<option value="tw"<c:out value="${pageMaker.cri.searchType eq 'tw'?'selected':''}"/>>제목or 작성자</option>					
						<option value="twc"<c:out value="${pageMaker.cri.searchType eq 'twc'?'selected':''}"/>>제목or 내용 or 작성자</option>			
					</select>					
					
					
					<input class="form-control bg-light border-0 small" type="text" name="keyword" id="keywordInput" value='${cri.keyword}'/>
	                <button id="searchBtn" class="btn btn-primary" type="button">
	                  <i class="fas fa-search fa-sm"></i>
	                </button>
				</div>						
			</div>
						
			<div class="table-container"  style="background-color:white;">
				<div class="docs-main">
					  <table class="tablesaw" data-tablesaw-mode="stack">
						  <thead>
								<tr>
									<th scope="col" data-tablesaw-priority="persist">BNO</th>
									<th scope="col" data-tablesaw-sortable-default-col data-tablesaw-priority="3">TITLE</th>
									<th scope="col" data-tablesaw-priority="2">WRITER</th>
									<th scope="col" data-tablesaw-priority="1">REGDATE</th>
									<th scope="col" data-tablesaw-priority="4">VIEWCNT</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="boardVO">
									<tr>
										<td class="title">${boardVO.bno}</td>
										<td><a href='/bbs/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}<strong>[${boardVO.replycnt}]</strong></a></td>
										<td>${boardVO.writer}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
										<td><span>${boardVO.viewcnt}</span></td>
									</tr>
								</c:forEach>
							</tbody>
			 		  </table>
				 </div>
			</div>
			
			<div class="pagenumber" >
				<div class="pagenumber-container">
					<ul>
						<c:if test="${pageMaker.prev}">
							<a href="listPage${pageMaker.makeSearch(pageMaker.startPage -1)}"><li>PREV</li></a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<a href="listPage${pageMaker.makeSearch(num)}"><li>${num}</li></a>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="listPage${pageMaker.makeSearch(pageMaker.endPage +1)}"><li>NEXT</li></a>
						</c:if>
					</ul>
				</div>
			</div>
		</div>

		</article>
	</section>
	

	<%@include file="./footer.jsp" %>
	

</body>
</html>


