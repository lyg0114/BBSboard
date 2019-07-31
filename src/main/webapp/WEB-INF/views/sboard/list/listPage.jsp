<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>

	<link rel="stylesheet" href="/bbs/resources/tablesaw-master/dist/tablesaw.css">
	  <!-- Custom styles for this template-->
  	<link href="/bbs/resources/sb-admin/css/sb-admin-2.min.css" rel="stylesheet">
  	<link href="/bbs/resources/sb-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="/bbs/resources/css/common.css" rel="stylesheet">
	
	<style>
	.democolwidth {
		width: 150px;
	}
	</style>
	 

	<script src="/bbs/resources/tablesaw-master/dist/tablesaw.js"></script>
	<script src="/bbs/resources/tablesaw-master/dist/tablesaw-init.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var result = '${msg}';
		if (result === 'success') {
			alert("Complete.");
		}
	
		$(document).ready(function() {
			$("#newBtn").on("click", function() {
				self.location = "/bbs/sboard/register";
			});
			
			$("#searchBtn").on("click", function(event){
				
				self.location = "listPage"+'${pageMaker.makeQuery(1)}'
								+"&searchType="
								+$("select option:selected").val()
								+"&keyword="+encodeURIComponent($("#keywordInput").val());
			});
			
			$("#logout").on("click",function(){
				self.location = "/bbs/user/logout";
			});
			
			
		});
	</script>
</head>
<body>

	<header id="header">
		<h1>WELECOME ${login.uid}</h1>
		<button id="logout">LOGOUT</button>
	</header>
	
	<hr>
	
	<section id="contents">
		<article>
         
	 	<div class="contents-container">
			<div class="search-option">
				<div class="input-group-append">
					<select name='searchType' class="btn btn-primary dropdown-toggle">
						<option value=""<c:out value="${pageMaker.cri.searchType == null?'selected':''}"/>>--</option>
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
				<!-- <button id="searchBtn">Search</button> -->
				<button id="newBtn" class="btn btn-NewRegister">NEWREGISTER</button>				
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
									<!-- <th>VIEWCNT</th> -->
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
	
	<footer id="footer"> </footer>


<!-- Bootstrap core JavaScript-->
  <script src="/bbs/resources/sb-admin/vendor/jquery/jquery.min.js"></script>
  <script src="/bbs/resources/sb-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/bbs/resources/sb-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/bbs/resources/sb-admin/js/sb-admin-2.min.js"></script>

</body>
</html>


