<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Modify</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="/bbs/resources/summernote-master/dist/summernote-bs4.css" rel="stylesheet">
	<script type="text/javascript" src="/bbs/resources/summernote-master/dist/summernote-bs4.js"></script>
	
<script>
$(function() {
	 $('.summernote').summernote({
	        height: 400,
	        lang: 'ko-KR' 
	  })
	$('.card-block').html('${boardVO.content}');
	 
	var formObj = $("form[role='form']");
	
	$(".btn-modify").on("click",function(){
		formObj.attr("method","post");
		formObj.attr("action","/bbs/sboard/modifyAction");
		formObj.submit();
	});
			
	$(".btn-primary").on("click",function(){
		self.location="/bbs/sboard/listPage?page=${cri.page}&perPagenum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});
	
</script>
</head>
<body>
	
	<header id="header">
		<div class="container">
			<h1>Modify</h1>
		</div>
	</header>
	<section id="contents">
		<article>
			<div class="container">
				<form role="form" action="post" >
					<input type='hidden' name="bno" value="${boardVO.bno}">
					<input type='hidden' name="page" value="${cri.page}">
					<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
					<input type='hidden' name="searchType" value="${cri.searchType}">
					<input type='hidden' name="keyword" value="${cri.keyword}">
					<table>
						<tr>
							<td><input readonly="readonly" class="form-control" name='writer' value="${boardVO.writer}" /></td>
						</tr>
						<tr>
							<td><input class="form-control" name='title' value="${boardVO.title}"/></td>
						</tr>
						<tr>
							<td><textarea class="summernote form-control" name='content'></textarea></td>
						</tr>
					</table>
				</form>
					
			</div>
			<div class="container">
				<div class="button-container">
					<button type="submit" class="btn btn-modify">SAVE</button>
					<button type="submit" class="btn btn-primary">CANCEL</button>
				</div>
			</div>
			
		</article>
	</section>
	
<link href="/bbs/resources/css/modifyPage.css" rel="stylesheet">
</body>
</html>




