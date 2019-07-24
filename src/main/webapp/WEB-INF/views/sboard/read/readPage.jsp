<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$(".btn-warning").on("click",function(){
			formObj.attr("action","/bbs/sboard/modifyPage");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		$(".btn-danger").on("click",function(){
			formObj.attr("method","post");
			formObj.attr("action","/bbs/sboard/removeAction");
			formObj.submit();
		});
		
		$(".btn-primary").on("click",function(){
			formObj.attr("method","get");
			formObj.attr("action","/bbs/sboard/listPage");
			formObj.submit();
		});
		
	})
</script>
<link href="/bbs/resources/css/readPage.css" rel="stylesheet">
</head>
<body>

	<header id="header">
		<h1>ReadPage</h1>
	</header>
	<section id="contents">
		<form role="form" >
			<input id="bno" type='hidden' name="bno" value="${boardVO.bno}">
			<input type='hidden' name="page" value="${cri.page}">
			<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
			<input type='hidden' name="searchType" value="${cri.searchType}">
			<input type='hidden' name="keyword" value="${cri.keyword}">
			
		</form>
		<div class="main-data">
			<table>
				<tr>
					<td><label>Bno</label></td>
					<td><input class="form-control" name='bno' value="${boardVO.bno}" readonly="readonly"></td>
				</tr>
				<tr>
					<td><label>Title</label></td>
					<td><input class="form-control" name='title' value="${boardVO.title}" readonly="readonly"></td>
				</tr>
				<tr>
					<td><label>Text area</label></td>
					<td><textarea class="form-control" name='content' readonly="readonly">${boardVO.content}</textarea></td>
				</tr>
				<tr>
					<td><label>Writer</label></td>
					<td><input class="form-control" name='writer' value="${boardVO.writer}" readonly="readonly"></td>
				</tr>
			</table>
			 
			 <c:if test="${login.uid == boardVO.writer }">
				<button type="submit" class="btn btn-warning">MODIFY</button>
				<button type="submit" class="btn btn-danger">REMOVE</button>
			</c:if>
				<button type="submit" class="btn btn-primary">LIST</button>
				
		</div>
		
		<%@include file="./reply/replyPage.jsp" %> 
	</section>
	
	<footer id="footer"> </footer>
	
</body>
</html>




