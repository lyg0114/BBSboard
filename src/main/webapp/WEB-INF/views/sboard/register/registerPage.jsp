<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
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
	<script src="/bbs/resources/summernote-master/lang/summernote-ko-KR.js"></script>
  	<script src="/bbs/resources/js/register.js" ></script>
  	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>
  <script id="template" type="text/x-handlebars-template">
  	<li>
		<span class="mailbox-attachement-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachement-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
		</div>	
	</li>
  </script>
	<script type="text/javascript">
	 $(function() {
	      $('.summernote').summernote({
	        height: 200,
	        placeholder: 'Contents . . . ',
	        lang: 'ko-KR' 
	      })
	
	      var $formObj = $("form[role='form']");
	      
	      $("#snedData").on("click",function(){
	    	  event.preventDefault();
	    	  var str="";
	    	  
	    	  $(".uploadedList .delbtn").each(function(index){
	    		  str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
	    	  });
	    	  	$formObj.append(str);
	    	  	$formObj.attr("method","post");
				$formObj.attr("action","/bbs/sboard/register");
				
				$formObj.get(0).submit();
			});
	      
	      $("#goListPage").on("click",function(){
	    	  self.location="/bbs/sboard/listPage";
			});
	      
	      var template = Handlebars.compile($("#template").html());
	      $(".fileDrop").on("dragenter dragover", function(event){ //파일을 드래그 해도 아무일도 안생김
				event.preventDefault();
			});
	      
	      $(".fileDrop").on("drop", function(event){  //파일을 드래그 해도 아무일도 안생김
				event.preventDefault();
			
				 var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				//console.log(file);
				
				var formData = new FormData();
				formData.append("file",file);
				
				$.ajax({
					url:'/bbs/uploadAjax',
					data:formData,
					dataTyep:'text',
					processData:false,
					contentType:false,
					type:'POST',
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						var html = template(fileInfo);
						
						$(".uploadedList").append(html)
					}
					
				});
				 
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
