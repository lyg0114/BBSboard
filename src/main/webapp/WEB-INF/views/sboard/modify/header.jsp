
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Modify</title>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<link href="/bbs/resources/css/modifyPage.css" rel="stylesheet">
	<link href="/bbs/resources/summernote-master/dist/summernote-bs4.css" rel="stylesheet">
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<script src="/bbs/resources/summernote-master/dist/summernote-bs4.js" type="text/javascript" ></script>
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
  <script id="templateNewAttach" type="text/x-handlebars-template">
  	<li>
	 <div class="img-container">
		<span><img src="{{imgsrc}}" alt="Attachment"></span>
		<div>
			<a href="{{getLink}}">{{fileName}}</a>
			<a href="{{fullName}}" class="delbtn AddNew"></a>
			<small data-src="{{fullName}}">X</small>
		</div>
	</div>	
	</li>
  </script>
<script>
$(function() {
	var $formObj = $("form[role='form']");
	var bno = ${boardVO.bno};
	
	var templateAttach = Handlebars.compile($("#templateAttach").html());
	var templateNewAttach = Handlebars.compile($("#templateNewAttach").html());
	$.getJSON("/bbs/sboard/getAttach/"+bno,function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = templateAttach(fileInfo);
			$(".uploadedList").append(html);
		});
		
	});
	
	 
    $(".fileDrop").on("dragenter dragover", function(event){ 
			event.preventDefault();
		});
    
    $(".fileDrop").on("drop", function(event){ 
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
					var html = templateNewAttach(fileInfo);
					
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
	
	
	 $('.summernote').summernote({
	        height: 200,
	        lang: 'ko-KR' 
	  })
	$('.card-block').html('${boardVO.content}');
	 
	
	$("#btn-modify").on("click",function(){
		 event.preventDefault();
	   	  var str="";
	   	  
	   	  $(".uploadedList .AddNew").each(function(index){
	   		  str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
	   	  });
   	  	$formObj.append(str);
   	  	
		$formObj.attr("method","post");
		$formObj.attr("action","/bbs/sboard/modifyAction");
		
		$formObj.get(0).submit();
		//formObj.submit();
	});
			
	$("#btn-primary").on("click",function(){
		self.location="/bbs/sboard/listPage?page=${cri.page}&perPagenum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});
	
</script>