
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Modify</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="/bbs/resources/summernote-master/dist/summernote-bs4.css" rel="stylesheet">
	<script type="text/javascript" src="/bbs/resources/summernote-master/dist/summernote-bs4.js"></script>
	
<script>
$(function() {
	 $('.summernote').summernote({
	        height: 400,
	        lang: 'ko-KR' 
	  })
	$('.card-block').html('${boardVO.content}');
	 
	var formObj = $("form[role='form']");
	
	$(".btn-modify").on("click",function(){
		formObj.attr("method","post");
		formObj.attr("action","/bbs/sboard/modifyAction");
		formObj.submit();
	});
			
	$(".btn-primary").on("click",function(){
		self.location="/bbs/sboard/listPage?page=${cri.page}&perPagenum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});
	
</script>