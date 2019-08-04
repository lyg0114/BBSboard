<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Register</title>

	 <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="/bbs/resources/summernote-master/dist/summernote-bs4.css" rel="stylesheet">
	<script type="text/javascript" src="/bbs/resources/summernote-master/dist/summernote-bs4.js"></script>
	
   <script type="text/javascript">
 $(function() {
      $('.summernote').summernote({
        height: 400
      });

      var formObj = $("form[role='form']");
      $("#snedData").on("click",function(){
    	  	formObj.attr("method","post");
			formObj.attr("action","/bbs/sboard/register");
			formObj.submit();
		});
      
      $("#goListPage").on("click",function(){
    	  self.location="/bbs/sboard/listPage";
		});
      
    });
  </script>
  
  
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
					          <textarea name="content" class="summernote" id="contents" title="Contents"></textarea>
					        </div>
				      </form>
				      <button id="snedData" type="submit"  class="btn btn-primary"/>REGISTER</button>
				      <button id="goListPage" class="btn btn-primary">goLIST</button>
				      		
				    </div>
			  </div>
		</div>
	</article>

</section>

<footer id="footer"> </footer>

<link href="/bbs/resources/css/registerPage.css" rel="stylesheet">
</body>
</html>
