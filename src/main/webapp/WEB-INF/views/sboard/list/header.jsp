<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>

	<link rel="stylesheet" href="/bbs/resources/tablesaw-master/dist/tablesaw.css">
  	<link href="/bbs/resources/sb-admin/css/sb-admin-2.min.css" rel="stylesheet">
  	<link href="/bbs/resources/sb-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="/bbs/resources/css/common.css" rel="stylesheet">


	<script src="/bbs/resources/tablesaw-master/dist/tablesaw.js"></script>
	<script src="/bbs/resources/tablesaw-master/dist/tablesaw-init.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script>
		var result = '${msg}';
		if (result === 'success') {
			alert("Complete.");
		}
	
		$(document).ready(function() {
			$("#newBtn").on("click", function() {
				self.location = "/bbs/sboard/register";
			});
			
			$("#searchBtn").on("click", function(event){
				
				self.location = "listPage"+'${pageMaker.makeQuery(1)}'
								+"&searchType="
								+$("select option:selected").val()
								+"&keyword="+encodeURIComponent($("#keywordInput").val());
			});
			
			$("#logout").on("click",function(){
				self.location = "/bbs/user/logout";
			});
			
			
		});
	</script>