<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<%@include file="./header.jsp" %>
</head>
<body>

	<header id="header">
		<div class="container">
			<h1>ReadPage</h1>
		<div class="container">
	</header>
	<section id="contents">
		<form role="form" >
			<input id="bno" type='hidden' name="bno" value="${boardVO.bno}">
			<input type='hidden' name="page" value="${cri.page}">
			<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
			<input type='hidden' name="searchType" value="${cri.searchType}">
			<input type='hidden' name="keyword" value="${cri.keyword}">
		</form>
		<article class="DetailContents">
			<div class="container">
					 <table>
						<tr>
							<td><div class="writer">${boardVO.writer}</div></td>
						</tr>
						<tr>
							<td><div class="title">${boardVO.title}</div></td>
						</tr>
						<tr>
							<td>
							<label class="content-title">Contents</label>
							<div class="content">${boardVO.content}</div>
							</td>
						</tr>
	
					</table> 
					 
					 <div class="button-set">
					 	<c:if test="${login.uid == boardVO.writer }">
							<button type="submit" class="btn btn-warning">MODIFY</button>
							<button type="submit" class="btn btn-danger">REMOVE</button>
						</c:if>
							<button type="submit" class="btn btn-primary">LIST</button>
					 </div>
					 
						
			</div>
		</article>
		
		<article class="replyPage">
			<div class="container">
				<%@include file="./reply/replyPage.jsp" %>
			</div>
		</article> 
	</section>
	
	<footer id="footer"> </footer>
	
</body>
</html>




