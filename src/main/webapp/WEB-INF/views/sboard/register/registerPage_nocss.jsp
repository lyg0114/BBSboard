<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>RegisterPage</title>
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

	<form role="form" method="post"><!-- actionÃ¬ÂÂ Ã¬ÂÂ¤Ã¬Â ÂÃ­ÂÂÃ¬Â§Â Ã¬ÂÂÃ¬ÂÂ¼Ã«Â©Â´ Ã­ÂÂÃ¬ÂÂ¬ ÃªÂ²Â½Ã«Â¡ÂÃ«Â¥Â¼ ÃªÂ·Â¸Ã«ÂÂÃ«Â¡Â Ã¬ÂÂ¬Ã¬ÂÂ©!  -->
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
			<td><label>Writer12</label></td>
			<td><input class="form-control" name='writer' value="${login.uid}"></td>
		</tr>
		
		</table>
		 
	<button type="submit"  class="btn btn-default">Submit Button</button>	
	</form>
	
		<button type="reset"   class="btn btn-reset">Reset Button</button>
		<button  class="btn btn-primary">listAll</button>


</body>
</html>