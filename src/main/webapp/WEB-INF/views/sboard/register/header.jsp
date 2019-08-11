 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Register</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<link href="/bbs/resources/summernote-master/dist/summernote-bs4.css" rel="stylesheet">
	<link href="/bbs/resources/css/registerPage.css" rel="stylesheet">
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<script src="/bbs/resources/summernote-master/dist/summernote-bs4.js" type="text/javascript" ></script>
	<script src="/bbs/resources/summernote-master/lang/summernote-ko-KR.js"></script>
  	<script src="/bbs/resources/js/file.js" ></script>
  	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>
 
  <script id="template" type="text/x-handlebars-template">
  	<li>
	 <div class="img-container">
		<span><img src="{{imgsrc}}" alt="Attachment"></span>
		<div>
			<a href="{{getLink}}">{{fileName}}</a>
			<a href="{{fullName}}" class="delbtn"></a>
			<small data-src="{{fullName}}">X</small>
		</div>
	</div>	
	</li>
  </script>
	<script type="text/javascript">
	 $(function() {
		 var $formObj = $("form[role='form']");
		 var template = Handlebars.compile($("#template").html());
		 
	      $('.summernote').summernote({
	        height: 200,
	        placeholder: 'Contents . . . ',
	        lang: 'ko-KR' 
	      })
	      
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
	      
	      
	      $(".fileDrop").on("dragenter dragover", function(event){ //파일을 드래그 해도 아무일도 안생김
				event.preventDefault();
			});
	      
	      $(".fileDrop").on("drop", function(event){  //파일을 드래그 해도 아무일도 안생김
				event.preventDefault();
			
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				
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
	      
	      $(".uploadedList").on("click","small", function(event){
				var that = $(this);
				
				$.ajax({
					url : "/bbs/deleteFile",
					type : "post",
					data : {fName:$(this).attr("data-src")},
					dataType : "text",
					success : function(result){
						if(result == 'deleted'){
							that.parents(".img-container").remove();
						}
					}
				});
				
			});
	      
	      
	    });
	  </script>