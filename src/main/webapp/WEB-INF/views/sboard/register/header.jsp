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