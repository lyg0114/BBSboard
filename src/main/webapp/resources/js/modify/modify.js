$(function() {
	var $formObj = $("form[role='form']");
	var bno = $("#boardBno").val();
	var boardContent = $("#boardContent").val();
	
	var page = $("#page").val();
	var perPageNum = $("#perPageNum").val();
	var searchType = $("#searchType").val();
	var keyword = $("#keyword").val();
	
	var templateNewAttach = Handlebars.compile($("#templateNewAttach").html());
	 
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
	$('.card-block').html(boardContent);
	 
	
	$("#btn-modify").on("click",function(){
		 event.preventDefault();
	   	 
		 
		 if($(".AddNew")!=null){
			 var str="";
		   	  $(".uploadedList .AddNew").each(function(index){
		   		  str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
		   	  });
	   	  	$formObj.append(str);
			 
		 }
		
   	  	
		$formObj.attr("method","post");
		$formObj.attr("action","/bbs/sboard/modifyAction");
		
		$formObj.get(0).submit();
		//formObj.submit();
	});
			
	$("#btn-primary").on("click",function(){
		self.location="/bbs/sboard/listPage?page="+page+"&perPagenum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	});
	
	
});