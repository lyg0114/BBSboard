<title>Home</title>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<link href="/bbs/resources/css/readPage.css" rel="stylesheet">
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<script src="/bbs/resources/js/file.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>
  	<script id="templateAttach" type="text/x-handlebars-template">
  	<li>
	 <div class="img-container">
		<span><img src="{{imgsrc}}" alt="Attachment"></span>
		<div>
			<a href="{{getLink}}">{{fileName}}</a>
			<a href="{{fullName}}" class="delbtn"></a>
		</div>
	</div>	
	</li>
  </script>

<script>
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
					
					$(".popup").show();
					imgTag.addClass("show");
				}
			});

		$("#popup_img").on("click",function(){
			$(".popup").hide();
		});
		
		
		$("#btn-modify").on("click",function(){
			formObj.attr("action","/bbs/sboard/modifyPage");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		$("#btn-remove").on("click",function(){
			
			var arr=[];
			$(".uploadedList li").each(function(index){
				arr.push($(this).attr("data-src"))
			});
			
			if(arr.length > 0){
				$.post(
						"/bbs/deleteAllFiles",
						{files:arr},
						function(){
				});
			}
			
			formObj.attr("method","post");
			formObj.attr("action","/bbs/sboard/removeAction");
			formObj.submit();
		});
		
		$("#btn-List").on("click",function(){
			formObj.attr("method","get");
			formObj.attr("action","/bbs/sboard/listPage");
			formObj.submit();
		});
		
	});
		

</script>
