


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
	$(".btn-primary").on("click",function(){
		self.location="/bbs/sboard/listPage";
	});
		
})
	
</script>
</head>
<body>
	<h1>Register</h1>

	<form role="form" method="post"><!-- actionì ì¤ì íì§ ìì¼ë©´ íì¬ ê²½ë¡ë¥¼ ê·¸ëë¡ ì¬ì©!  -->
		<table>
		<tr>
			<td><label>Title</label></td>
			<td><input class="form-control" name='title'></td>
		</tr>
		<tr>
			<td><label>Text area</label></td>
			<td><textarea class="form-control" name='content'></textarea></td>
		</tr>
		<tr>
			<td><label>Writer</label></td>
			<td><input class="form-control" name='writer'></td>
		</tr>
		
		</table>
		 
	<button type="submit"  class="btn btn-default">Submit Button</button>	
	</form>
	
		<button type="reset"   class="btn btn-reset">Reset Button</button>
		<button  class="btn btn-primary">listAll</button>


</body>
</html>
