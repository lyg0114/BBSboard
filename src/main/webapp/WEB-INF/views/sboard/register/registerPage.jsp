<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
 	<%@include file="./header.jsp" %>
</head>

<body>
<header id="header">
	<div class="container">
		<h1>REGISTER</h1>
	</div>
</header>


<section id="contents">
	<article>
		<div class="container">
			  <div class="card">
				    <div class="card-body">
				      <form role="form">
					        <div class="form-group">
					          <input name="writer" type="text" class="form-control" id="input" value="${login.uid}">
					        </div>
					        
					        <div class="form-group">
					          <input name="title" type="text" class="form-control" id="input" placeholder="TITLE">
					        </div>
					        
					        <div class="form-group">
					          <label for="contents">Contents</label>
					          <textarea name="content" class="summernote" id="summernote" title="Contents"></textarea>
					        </div>
					        
					        <div class="form-group">
					        	<label for="exampleInputEmail1">FILE DROP HERE</label>
					        	<div class="fileDrop"></div>
					        </div>
					        
					        <div class="box-footer">
					        	<div>	
					        		<hr>
					        	</div>
					        	
					        	<ul class="mailbox-attachments clearfix uploadedList">
					        	</ul>
					        </div>
					        
				      </form>
				      <button id="snedData" type="submit"  class="btn btn-primary"/>REGISTER</button>
				      <button id="goListPage" class="btn btn-primary">LIST</button>
				      		
				    </div>
			  </div>
		</div>
	</article>

</section>
	
	<%@include file="./footer.jsp" %>
<footer id="footer"> </footer>


</body>
</html>
