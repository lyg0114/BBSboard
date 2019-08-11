$(function() {
		 var $formObj = $("form[role='form']");
		 var templateNewAttach = Handlebars.compile($("#templateNewAttach").html());
		 
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
	      
	      
	    });