<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	<script src="/bbs/resources/js/register.js" ></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>
  	 <script id="templateAttach" type="text/x-handlebars-template">
  	  <li data-src='{{fullName}}'>
		 <span class="mailbox-attachement-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		 <div class="mailbox-attachment-info">
			 <a href="{{getLink}}" class="mailbox-attachement-name">{{fileName}}</a>
	 	 </div>	
	  </li>
  	</script>

<script>
	//$(document).ready(function(){
	$(function() {
		var formObj = $("form[role='form']");
		var bno = ${boardVO.bno};
		var template = Handlebars.compile($("#templateAttach").html());
		
		$.getJSON("/bbs/sboard/getAttach/"+bno,function(list){
			$(list).each(function(){
				var fileInfo = getFileInfo(this);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			});
			
		});
		
		$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
			
			var fileLink = $(this).attr("href");
			
				if(checkImageType(fileLink)){
					event.preventDefault();
					
					var imgTag = $("#popup_img");
					imgTag.attr("src",fileLink);
					
					console.log(imgTag.attr("src"));
					
					$(".popup").show();
					imgTag.addClass("show");
					
				}
			
			});

		$("#popup_img").on("click",function(){
			$(".popup").hide();
		});
		
		
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
		
	});
		

</script>
<link href="/bbs/resources/css/readPage.css" rel="stylesheet">