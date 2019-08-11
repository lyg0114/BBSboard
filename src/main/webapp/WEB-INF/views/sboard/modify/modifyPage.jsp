<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="./header.jsp" %>
</head>
<body>
	
	<header id="header">
		<div class="container">
			<h1>MODIFY</h1>
		</div>
	</header>
	<section id="contents">
		<article>
			<div class="container">
				<form role="form" action="post" >
					<input id="boardBno" type='hidden' name="bno" value="${boardVO.bno}">
					<input id="boardContent" type='hidden' name="bno" value="${boardVO.content}">
					<input id="page" type='hidden' name="page" value="${cri.page}">
					<input id="perPageNum" type='hidden' name="perPageNum" value="${cri.perPageNum}">
					<input id="searchType" type='hidden' name="searchType" value="${cri.searchType}">
					<input id="keyword" type='hidden' name="keyword" value="${cri.keyword}">
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
				
				<div>
		        	<label for="exampleInputEmail1">FILE DROP HERE</label>
		        	<div class="fileDrop"></div>
		        </div>
		        <div class="box-footer">
		        	<div>	
		        		<hr>
		        	</div>
				<ul class="uploadedList"></ul>
					
			</div>
			
			
			<div class="container">
				<div class="button-container">
					<button id="btn-modify" type="submit" class="btn btn-modify">SAVE</button>
					<button id="btn-primary" type="submit" class="btn btn-primary">LIST</button>
				</div>
			</div>
			
		</article>
	</section>
	
	<%@include file="./footer.jsp" %>

</body>
</html>




