<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$(".btn-warning").on("click",function(){
			formObj.attr("action","/bbs/board/modify");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		$(".btn-danger").on("click",function(){
			formObj.attr("method","post");
			formObj.attr("action","/bbs/board/remove");
			formObj.submit();
		});
		
		$(".btn-primary").on("click",function(){
			self.location="/bbs/board/listPage";
		});
		
	})
</script>
</head>
<body>
	<h1>Read</h1>
	<form role="form" >
		<input type='hidden' name="bno" value="${boardVO.bno}">
	</form>
	
		<table>
			<tr>
				<td><label>Bno</label></td>
				<td><input class="form-control" name='bno' value="${boardVO.bno}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>Title</label></td>
				<td><input class="form-control" name='title' value="${boardVO.title}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>Text area</label></td>
				<td><textarea class="form-control" name='content' readonly="readonly">${boardVO.content}</textarea></td>
			</tr>
			<tr>
				<td><label>Writer</label></td>
				<td><input class="form-control" name='writer' value="${boardVO.writer}" readonly="readonly"></td>
			</tr>
		</table>
		 
		<button type="submit" class="btn btn-warning">MODIFY</button>
		<button type="submit" class="btn btn-danger">REMOVE</button>
		<button type="submit" class="btn btn-primary">LIST</button>


</body>
</html>




