<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="/bbs/resources/css/common.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var result = '${msg}';
	if (result === 'success') {
		alert("Complete.");
	}

	$(document).ready(function() {
		$(".btn-NewRegister").on("click", function() {
			self.location = "/bbs/board/register";
		});
	})
</script>
</head>
<body>
	<header id="header">
		<h1>listAll</h1>
	</header>
	<section id="contents">
		<article>
		
		<div class="contents-container">
			<div class="table-container">
				  <table>
					<tr>
						<th>BNO</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>REGDATE</th>
						<!-- <th>VIEWCNT</th> -->
					</tr>
					<c:forEach items="${list}" var="boardVO">
						<tr>
							<td>${boardVO.bno}</td>
							<%-- <td><a href='/bbs/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td> //oldVersion//--%>
							<%-- <td><a href='/bbs/board/read${pageMaker.makeQuery(pateMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></td> --%>
							<td><a href='/bbs/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
							<td><span>${boardVO.viewcnt}</span></td>
						</tr>
	
					</c:forEach>
				 </table>
				<button type="submit" class="btn btn-NewRegister">NEWREGISTER</button>		
			</div>
			
			<div class="pagenumber">
				<div class="pagenumber-container">
					<ul>
						<c:if test="${pageMaker.prev}">
							<%-- <li><a href="listPage?page=${pageMaker.startPage -1}">Previous</a> old--%>
							<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage -1)}">PREV</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<%-- <li><a href="listPage?page=${num}">${num}</a></li> old--%>
							<li><a href="listPage${pageMaker.makeQuery(num)}">${num}</a></li>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<%-- <li><a href="listPage?page=${pageMaker.endPage +1}">Next</a></li> old --%>
							<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage +1)}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>

		</article>
	</section>
	
	<footer id="footer"> </footer>




</body>
</html>


